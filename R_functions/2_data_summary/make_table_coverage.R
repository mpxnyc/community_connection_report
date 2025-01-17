make_table_coverage_sim         <- function(intervention_priority_input = "contact", intervention_stratification_input = "overall"){
  
  
  targets::tar_read(data_intervention_results_coverage_simulated)[["place_coverage"]] |>
                dplyr::filter(
                              intervention_priority == intervention_priority_input, 
                              strata == intervention_stratification_input
                ) |>
                dplyr::mutate(level = intervention_contact_place) |>
                dplyr::group_by(intervention_priority, intervention_ranking, strata) |>
                dplyr::summarize(
                                  mean_count       = mean(count), 
                                  count_ci_lb      = quantile(count, 0.025), 
                                  count_ci_ub      = quantile(count, 0.975),
                                  mean_proportion  = mean(proportion),
                                  proportion_ci_lb = quantile(proportion, 0.025),
                                  proportion_ci_ub = quantile(proportion, 0.975),
                                  mean_cum_prop    = mean(cum_prop),
                                  cum_prop_ci_lb   = quantile(cum_prop, 0.025),
                                  cum_prop_ci_ub   = quantile(cum_prop, 0.975)
                ) |>
                dplyr::ungroup() |>
                dplyr::arrange(-mean_count) 
  
}

make_table_coverage             <- function(intervention_priority_input = "contact", intervention_stratification_input = "overall"){

  simulated_data      <- make_table_coverage_sim(intervention_priority_input, intervention_stratification_input)
  
  
  collected_data      <- targets::tar_read(data_intervention_results_coverage_collected)[["place_coverage"]] |>
                              dplyr::filter(
                                            intervention_priority == intervention_priority_input, 
                                            strata == intervention_stratification_input
                              ) |>
                              dplyr::mutate(level = intervention_contact_place) |>
                              dplyr::ungroup() |>
                              dplyr::mutate(level = as.character(level)) |>
                              dplyr::arrange(-count)
         
   simulated_data |>
     dplyr::left_join(collected_data, by = c("strata", "intervention_priority", "intervention_ranking")) |>
     {function(x) dplyr::select(x,  level, intervention_ranking, group, intervention_priority, strata, count, names(x))}() |>
     dplyr::rename(name = level) |>
     dplyr::mutate(borough = mpxnyc::convert_spatial_unit_ny(input_community_district = name, convert_to = "borough")) |>
     {function(x) dplyr::select(x, name, borough, names(x))}()
                      
}

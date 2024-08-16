make_coverage_table_sim         <- function(intervention_priority_input = "contact", intervention_stratification_input = "overall"){
  
  
  
  
  targets::tar_read(data_intervention_results_coverage_simulated)[["place_coverage"]] %>%
    filter(
      intervention_priority == intervention_priority_input, 
      strata == intervention_stratification_input
    ) %>%
    mutate(level = intervention_contact_place) %>%
    group_by(intervention_priority, intervention_ranking, strata) %>%
    summarize(
      mean_count = mean(count), 
      count_ci_lb = quantile(count, 0.025), 
      count_ci_ub = quantile(count, 0.975),
      mean_proportion = mean(proportion),
      proportion_ci_lb = quantile(proportion, 0.025),
      proportion_ci_ub = quantile(proportion, 0.975),
      mean_cum_prop = mean(cum_prop),
      cum_prop_ci_lb = quantile(cum_prop, 0.025),
      cum_prop_ci_ub = quantile(cum_prop, 0.975)
    ) %>%
    ungroup() %>%
    arrange(-mean_count) 
  
}

make_coverage_table             <- function(intervention_priority_input = "contact", intervention_stratification_input = "overall"){

  simulated_data      <- make_coverage_table_sim(intervention_priority_input, intervention_stratification_input)
  
  
  collected_data      <- targets::tar_read(data_intervention_results_coverage_collected)[["place_coverage"]] %>%
                              filter(
                                intervention_priority == intervention_priority_input, 
                                strata == intervention_stratification_input
                              ) %>%
                              mutate(level = intervention_contact_place) %>%
                              ungroup() %>%
                              mutate(level = as.character(level)) %>%
                              arrange(-count)
         
   simulated_data %>%
     left_join(collected_data, by = c("strata", "intervention_priority", "intervention_ranking")) %>%
     select(  level, intervention_ranking, group, intervention_priority, strata, count, names(.)) %>%
     rename(name = level) %>%
     mutate(borough = mpxnyc::convert_spatial_unit_ny(input_community_district = name, convert_to = "borough")) %>%
     select(name, borough, names(.))
                      
}

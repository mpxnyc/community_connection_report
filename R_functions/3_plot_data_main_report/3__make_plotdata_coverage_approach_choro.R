make_plotdata_coverage_approach_choro <- function(
    data_intervention_results_coverage_simulated_place_coverage = targets::tar_read(data_intervention_results_coverage_simulated)[["place_coverage"]],
    data_intervention_results_coverage_collected_place_coverage = targets::tar_read(data_intervention_results_coverage_collected)[["place_coverage"]]  
  ){
  data_1                     <- make_table_coverage(
    intervention_priority = "contact", 
    intervention_stratification = "overall",
    data_intervention_results_coverage_simulated_place_coverage = data_intervention_results_coverage_simulated_place_coverage,
    data_intervention_results_coverage_collected_place_coverage = data_intervention_results_coverage_collected_place_coverage
  ) |>
    dplyr::mutate(stratum = "Contact neutralizing approach")
  
  data_2                     <- make_table_coverage(
    intervention_priority = "movement", 
    intervention_stratification = "overall",
    data_intervention_results_coverage_simulated_place_coverage = data_intervention_results_coverage_simulated_place_coverage,
    data_intervention_results_coverage_collected_place_coverage = data_intervention_results_coverage_collected_place_coverage
  ) |>
    dplyr::mutate(stratum = "Movement neutralizing approach")
  
  
  data_1 |>
    rbind(data_2)
}
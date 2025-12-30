make_plotdata_coverage_approach_bar <- function(
    data_intervention_results_coverage_simulated_place_coverage = targets::tar_read(data_intervention_results_coverage_simulated)[["place_coverage"]],
    data_intervention_results_coverage_collected_place_coverage = targets::tar_read(data_intervention_results_coverage_collected)[["place_coverage"]] 
    ){
  make_plotdata_coverage_approach_choro(
    data_intervention_results_coverage_simulated_place_coverage = data_intervention_results_coverage_simulated_place_coverage,
    data_intervention_results_coverage_collected_place_coverage = data_intervention_results_coverage_collected_place_coverage 
  ) |>
    dplyr::filter(group != "Group C") 
}
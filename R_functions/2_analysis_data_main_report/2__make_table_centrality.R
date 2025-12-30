make_table_centrality <- function(data_intervention_results_centrality_collected = targets::tar_read(data_intervention_results_centrality_collected)){
  data_intervention_results_centrality_collected |>
    dplyr::filter(intervention_stratification == "overall") |>
    dplyr::filter(intervention_ranking <= 40) |>
    dplyr::mutate(intervention_priority = factor(intervention_priority, c("contact", "movement"), c("Contact neutralizing approach", "Movement neutralizing approach"))) |>
    dplyr::mutate(group = factor(group, c("n_vaccinated", "n_remainder", "n_lcc"), c("Vaccinated", "Unvaccinated not in LCC", "Unvaccinated in LCC")))
}
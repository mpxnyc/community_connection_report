make_table_centrality <- function(){
  targets::tar_read(data_intervention_results_centrality_collected) |>
    dplyr::filter(intervention_stratification == "overall") |>
    dplyr::filter(intervention_ranking <= 40) |>
    dplyr::mutate(intervention_priority = factor(intervention_priority, c("contact", "movement"), c("Contact-based strategy", "Movement-based strategy"))) |>
    dplyr::mutate(group = factor(group, c("n_vaccinated", "n_remainder", "n_lcc"), c("Vaccinated", "Unvaccinated in LCC", "Unvaccinated not in LCC")))
}
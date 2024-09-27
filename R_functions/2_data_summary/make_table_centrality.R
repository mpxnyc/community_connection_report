make_table_centrality <- function(){
  tar_read(data_intervention_results_centrality_collected) %>%
    filter(intervention_stratification == "overall") %>%
    filter(intervention_ranking <= 40) %>%
    mutate(intervention_priority = factor(intervention_priority, c("contact", "movement"), c("Contact-based strategy", "Movement-based strategy"))) %>%
    mutate(group = factor(group, c("n_vaccinated", "n_remainder", "n_lcc"), c("Vaccinated", "Unvaccinated in LCC", "Unvaccinated not in LCC")))
}
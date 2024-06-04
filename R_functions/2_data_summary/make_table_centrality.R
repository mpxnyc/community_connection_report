make_table_centrality       <- function(){
  targets::tar_read(data_intervention_results_centrality_collected) %>%
    dplyr::transmute(
      intervention_ranking, 
      n_lcc                       = mean_n_lcc, 
      n_remainder                 = mean_n_remainder, 
      n_singleton                 = mean_n_singleton, 
      intervention_priority, 
      intervention_stratification
    ) %>%
    tidyr::pivot_longer(cols = c(n_lcc, n_remainder, n_singleton))
}
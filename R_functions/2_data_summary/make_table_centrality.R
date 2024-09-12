make_table_centrality       <- function(intervention_stratification_input = "overall", intervention_priority_input = "contact"){
  
  n_participants     <- targets::tar_read(data_bipartite_graph_collected) %>%
                                tidygraph::activate(nodes) %>%
                                dplyr::filter(type) %>%
                                igraph::gorder()
  
  
  collected_n        <- targets::tar_read(data_intervention_results_centrality_collected) %>%
                                dplyr::filter(intervention_stratification == intervention_stratification_input, intervention_priority == intervention_priority_input) %>%
                                dplyr::transmute(
                                                intervention_ranking, 
                                                lcc                       = mean_n_lcc, 
                                                remainder                 = mean_n_remainder, 
                                                singleton                 = mean_n_singleton, 
                                                avg_betweenness           = mean_avg_betweenness,
                                                sd_closeness              = mean_sd_closeness,
                                                intervention_priority, 
                                                intervention_stratification
                                ) %>%
                                tidyr::pivot_longer(cols = c(lcc, remainder, singleton, avg_betweenness, sd_closeness)) %>%
                                dplyr::rename(est = value)
  
  
  simulated_mean     <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
                                dplyr::transmute(
                                                intervention_ranking, 
                                                lcc                       = mean_n_lcc, 
                                                remainder                 = mean_n_remainder, 
                                                singleton                 = mean_n_singleton, 
                                                avg_betweenness           = mean_avg_betweenness,
                                                sd_closeness             = mean_sd_closeness,
                                                intervention_priority, 
                                                intervention_stratification
                                ) %>%
    tidyr::pivot_longer(cols = c(lcc, remainder, singleton, avg_betweenness, sd_closeness)) %>%
    dplyr::rename(bootstrap_est = value)
  
  # simulated_ci_lb    <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
  #                               dplyr::transmute(
  #                                                 intervention_ranking, 
  #                                                 lcc                       = ci_lb_n_lcc, 
  #                                                 remainder                 = ci_lb_n_remainder, 
  #                                                 singleton                 = ci_lb_n_singleton, 
  #                                                 avg_betweenness           = ci_lb_avg_betweenness,
  #                                                 sd_closeness              = ci_lb_sd_closeness,
  #                                                 intervention_priority, 
  #                                                 intervention_stratification
  #                               ) %>%
  #   tidyr::pivot_longer(cols = c(lcc, remainder, singleton, avg_betweenness, sd_closeness)) %>%
  #   dplyr::rename(bootstrap_ci_lb = value)
  # 
  # simulated_ci_ub    <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
  #                               dplyr::transmute(
  #                                                 intervention_ranking, 
  #                                                 lcc                       = ci_ub_n_lcc, 
  #                                                 remainder                 = ci_ub_n_remainder, 
  #                                                 singleton                 = ci_ub_n_singleton, 
  #                                                 avg_betweenness           = ci_ub_avg_betweenness,
  #                                                 sd_closeness             = ci_ub_sd_closeness,
  #                                                 intervention_priority, 
  #                                                 intervention_stratification
  #                               ) %>%
  #   tidyr::pivot_longer(cols = c(lcc, remainder, singleton, avg_betweenness, sd_closeness)) %>%
  #   dplyr::rename(bootstrap_ci_ub = value)
  
  
  collected_n %>%
    dplyr::left_join(simulated_mean,  by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    #dplyr::left_join(simulated_ci_lb, by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    #dplyr::left_join(simulated_ci_ub, by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    dplyr::group_by(intervention_ranking, intervention_priority, intervention_stratification) %>%
    dplyr::mutate(empty = !(sum(est) > 0)) %>%
    tidyr::pivot_wider(names_from = name, values_from = est, id_cols = c(intervention_ranking, intervention_priority, intervention_stratification) ) %>%
    dplyr::mutate(n_participants = n_participants) %>%
    dplyr::mutate(n_unvaccinated = singleton + remainder + lcc)
  }
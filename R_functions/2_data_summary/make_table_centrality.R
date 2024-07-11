make_table_centrality       <- function(intervention_stratification_input = "overall", intervention_priority_input = "contact"){
  collected_n <- targets::tar_read(data_intervention_results_centrality_collected) %>%
                    dplyr::filter(intervention_stratification == intervention_stratification_input, intervention_priority == intervention_priority_input) %>%
                    dplyr::transmute(
                      intervention_ranking, 
                      lcc                       = mean_n_lcc, 
                      remainder                 = mean_n_remainder, 
                      singleton                 = mean_n_singleton, 
                      intervention_priority, 
                      intervention_stratification
                    ) %>%
                    tidyr::pivot_longer(cols = c(lcc, remainder, singleton)) %>%
                    rename(est = value)
  
  
  simulated_mean <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
                    dplyr::transmute(
                      intervention_ranking, 
                      lcc                       = mean_n_lcc, 
                      remainder                 = mean_n_remainder, 
                      singleton                 = mean_n_singleton, 
                      intervention_priority, 
                      intervention_stratification
                    ) %>%
                    tidyr::pivot_longer(cols = c(lcc, remainder, singleton)) %>%
                    rename(bootstrap_est = value)
  
  simulated_ci_lb <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
                    dplyr::transmute(
                      intervention_ranking, 
                      lcc                       = ci_lb_n_lcc, 
                      remainder                 = ci_lb_n_remainder, 
                      singleton                 = ci_lb_n_singleton, 
                      intervention_priority, 
                      intervention_stratification
                    ) %>%
                    tidyr::pivot_longer(cols = c(lcc, remainder, singleton)) %>%
                    rename(bootstrap_ci_lb = value)
  
  simulated_ci_ub <- targets::tar_read(data_intervention_results_centrality_simulated) %>%
                        dplyr::transmute(
                          intervention_ranking, 
                          lcc                       = ci_ub_n_lcc, 
                          remainder                 = ci_ub_n_remainder, 
                          singleton                 = ci_ub_n_singleton, 
                          intervention_priority, 
                          intervention_stratification
                        ) %>%
                        tidyr::pivot_longer(cols = c(lcc, remainder, singleton)) %>%
                        rename(bootstrap_ci_ub = value)
  
  
  collected_n %>%
    left_join(simulated_mean,  by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    left_join(simulated_ci_lb, by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    left_join(simulated_ci_ub, by = c("intervention_ranking", "intervention_priority", "intervention_stratification", "name")) %>%
    group_by(intervention_ranking, intervention_priority, intervention_stratification) %>%
    mutate(empty = !(sum(est) > 0)) %>%
    filter()

  }
get_graph_descriptives_single  <- function(coverage_bipartite_graph_sim, ranking_input){
  
  print("making")
  print(ranking_input)
  print("nodes")
  print(igraph::gorder(coverage_bipartite_graph_sim))
  
  

    result <- coverage_bipartite_graph_sim %>%
      tidygraph::activate(nodes) %>%
      tidygraph::pull(rep) %>%
      unique() %>%
      purrr::map(
        function(input_rep){
          coverage_bipartite_graph_sim %>%
            tidygraph::activate(nodes) %>%
            tidygraph::ungroup() %>%
            tidygraph::filter(rep == input_rep) %>%
            get_graph_descriptives_pre(ranking = ranking_input, rep = input_rep)
        }
      )  %>%
      dplyr::bind_rows() %>%
      dplyr::summarize(
        n_lcc_ci_lb       = quantile(n_lcc, 0.025),
        n_lcc_ci_ub       = quantile(n_lcc, 0.975),
        n_lcc             = mean(n_lcc),
        n_singleton_ci_lb = quantile(n_singleton, 0.025),
        n_singleton_ci_ub = quantile(n_singleton, 0.975),
        n_singleton       = mean(n_singleton),
        n_remainder_ci_lb = quantile(n_remainder, 0.025),
        n_remainder_ci_ub = quantile(n_remainder, 0.975),
        n_remainder       = mean(n_remainder),
        n_total_ci_lb     = quantile(n_total_count, 0.025),
        n_total_ci_ub     = quantile(n_total_count, 0.975),
        n_total           = mean(n_total_count),
        strata                = dplyr::first(strata),
        intervention_priority = dplyr::first(intervention_priority),
        intervention_setting  = dplyr::first(intervention_setting)
      ) %>%
      dplyr::mutate(ranking = ranking_input) %>%
      dplyr::select(strata, intervention_priority, intervention_setting, ranking, n_total, n_lcc, n_singleton, n_remainder, names(.))
    
 
  
  return(result)
   
}
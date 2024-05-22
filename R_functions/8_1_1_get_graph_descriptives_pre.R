get_graph_descriptives_pre <- function(coverage_bipartite_graph_sim, ranking, rep) {
  
  strata                 <- coverage_bipartite_graph_sim %>% pull(strata) %>% unique()
  intervention_priority  <- coverage_bipartite_graph_sim %>% pull(intervention_priority) %>% unique()
  intervention_setting   <- coverage_bipartite_graph_sim %>% pull(intervention_setting) %>% unique()
  
  working_graph       <- coverage_bipartite_graph_sim %>%
                                igraph::bipartite_projection(which = "true") %>%
                                tidygraph::as_tbl_graph() 
  
  component_sizes     <- igraph::components(working_graph)$csize
  total_count         <- sum(component_sizes)
  size_of_lcc         <- max(component_sizes)
  count_of_singletons <- sum(component_sizes == 1)
  
  data.frame(
    rep = rep,
    ranking = ranking,
    n_lcc = size_of_lcc ,
    n_singleton = count_of_singletons,
    n_total_count = total_count
  ) %>%
    dplyr::mutate(n_remainder = n_total_count - n_lcc - n_singleton) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(strata = strata, intervention_priority = intervention_priority, intervention_setting = intervention_setting)
  
}
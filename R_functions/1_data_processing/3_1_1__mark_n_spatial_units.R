


mark_n_spatial_units <- function(bipartite_graph, n_neighborhoods, intervention_priority_input, strata){
  
  strata           <- rlang::enquo(strata)
  strata_name      <- rlang::quo_text(strata)
  
  
  coverage_graph   <- helper_initialize_coverage_graph(bipartite_graph, {{strata}})
  n_strata         <- attr(coverage_graph, "n_strata")
  strata_levels    <- attr(coverage_graph, "strata_levels")
  

  seq(n_neighborhoods) %>%
    purrr::reduce(
      function(accumulated_value, next_value){
        
        stratum                     <- strata_levels[(next_value %% n_strata) + 1]
        top_neighborhoods           <- find_top_spatial_units(accumulated_value, intervention_priority_input, stratum)
        
        mark_top_spatial_units(accumulated_value, top_neighborhoods)
        
      },
      .init = coverage_graph
    ) %>%
    mutate(strata                = strata_name) %>%
    mutate(intervention_priority = intervention_priority_input) %>%
    mutate(intervention_ranking  = ifelse(is.na(intervention_ranking), 999, intervention_ranking))
  
}



helper_initialize_coverage_graph <- function(bipartite_graph, strata){
  
  bipartite_graph_initialized                            <- bipartite_graph %>% 
    activate(nodes) %>%
    mutate(intervention_ranking = NA) %>%
    mutate(stratum = {{strata}}) %>%
    mutate(intervention_contact_place = NA)
  
  attr(bipartite_graph_initialized, "top_rank")          <- 0
  attr(bipartite_graph_initialized, "strata_levels")     <- bipartite_graph_initialized %>%
    pull(stratum) %>%
    unique()
  
  attr(bipartite_graph_initialized, "n_strata")          <- attr(bipartite_graph_initialized, "strata_levels") %>% 
    length()
  
  
  bipartite_graph_initialized
}

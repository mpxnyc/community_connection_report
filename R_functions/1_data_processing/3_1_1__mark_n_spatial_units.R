mark_n_spatial_units <- function(bipartite_graph_sim, n_neighborhoods, intervention_priority_input, strata){
  
  strata <- rlang::enquo(strata)
  
  bipartite_graph_sim_ranked <- bipartite_graph_sim %>% 
    activate(nodes) %>%
    mutate(intervention_ranking = NA) %>%
    mutate(stratum = {{strata}}) %>%
    mutate(intervention_contact_place = NA)
  
  
  strata_levels             <- bipartite_graph_sim_ranked %>%
    pull(stratum) %>%
    unique()
  
  n_strata <- length(strata_levels)
  
  count <- 0
  attr(bipartite_graph_sim_ranked, "top_rank") <- 0
  
  
  seq(n_neighborhoods) %>%
    purrr::reduce(
      function(accumulated_value, next_value){
        
        
        stratum <- strata_levels[(next_value %% n_strata) + 1]
        
        top_neighborhoods          <- find_top_spatial_units(
          accumulated_value, 
          intervention_priority_input, 
          stratum)
        
        
        result <- mark_top_spatial_units(accumulated_value, top_neighborhoods)
        
        
        return(result)
      },
      .init = bipartite_graph_sim_ranked
    ) %>%
    mutate(strata                = rlang::quo_text(strata)) %>%
    mutate(intervention_priority = intervention_priority_input) %>%
    mutate(intervention_ranking  = ifelse(is.na(intervention_ranking), 999, intervention_ranking))
  
}


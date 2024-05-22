mark_n_neighborhoods <- function(bipartite_graph_sim, n_neighborhoods, intervention_priority_input, intervention_setting_input, strata){
  
  strata <- rlang::enquo(strata)
  
  bipartite_graph_sim_ranked <- bipartite_graph_sim %>% 
    activate(nodes) %>%
    mutate(intervention_ranking = NA) %>%
    mutate(stratum = {{strata}}) 
  
  
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
        
        top_neighborhoods          <- find_top_neighborhoods(
          accumulated_value, 
          intervention_priority_input, 
          intervention_setting_input, 
          stratum)
        
        
        result <- mark_top_neighborhoods(accumulated_value, top_neighborhoods, intervention_setting_input)
        
        
        return(result)
      },
      .init = bipartite_graph_sim_ranked
    ) %>%
    mutate(strata                = rlang::quo_text(strata)) %>%
    mutate(intervention_priority = intervention_priority_input) %>%
    mutate(intervention_setting  = paste(intervention_setting_input, collapse=".")) %>%
    mutate(intervention_ranking  = ifelse(is.na(intervention_ranking), 999, intervention_ranking))
  
}


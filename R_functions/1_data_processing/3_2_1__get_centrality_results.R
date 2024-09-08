get_centrality_results <- function(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "contact", intervention_stratification_input = "overall"){
  
  rankings_place    <- intervention_coverage_data_sim[["place_coverage"]] %>%
                          dplyr::filter(intervention_priority == intervention_priority_input) %>%
                          dplyr::filter(strata == intervention_stratification_input) %>%
                          dplyr::transmute(name = intervention_contact_place, intervention_ranking) %>%
                          dplyr::arrange(intervention_ranking) 
  
  rankings_person   <- intervention_coverage_data_sim[["person_coverage"]] %>%
                          dplyr::filter(intervention_priority == intervention_priority_input) %>%
                          dplyr::filter(strata == intervention_stratification_input) %>%
                          dplyr::transmute(name = name, intervention_ranking) %>%
                          dplyr::arrange(intervention_ranking)
  
  rankings          <- rbind(rankings_place, rankings_person)
  
  reps              <- intervention_coverage_data_sim[["place_coverage"]] %>%
                          dplyr::pull(rep) %>%
                          max()
  
  working_graph     <- bipartite_graph_sim %>%
                          dplyr::left_join(rankings) %>%
                          dplyr::select(name, intervention_ranking, type, rep)
  
  rankings %>%
    dplyr::pull(intervention_ranking) %>%
    unique() %>%
    purrr::map(
      function(rank){
        
        inner_working_graph <- working_graph %>%
                                    tidygraph::filter(intervention_ranking > rank - 1 | is.na(intervention_ranking)) %>%
          select(- intervention_ranking)
        
        
        components <- inner_working_graph %>%
                            calculate_component_stats() 
        
        centrality <- inner_working_graph %>%
                            calculate_centrality_stats() %>%
                            dplyr::mutate(intervention_ranking = rank)
        
        cbind(components, centrality)
      }
    ) %>%
    dplyr::bind_rows() %>%
    dplyr::mutate(
                  intervention_priority = intervention_priority_input,
                  intervention_stratification = intervention_stratification_input
    ) 
  
}
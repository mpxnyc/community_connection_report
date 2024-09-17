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
                          dplyr::left_join(rankings, by = "name") %>%
                          dplyr::select(name, intervention_ranking, type, rep)
  
  total_participants <- working_graph %>%
                            pull(type) %>%
                            sum()
  
  rankings %>%
    dplyr::pull(intervention_ranking) %>%
    unique() %>%
    purrr::map(
      function(rank){
        
        inner_working_graph <- working_graph %>%
                                    tidygraph::filter(intervention_ranking > rank - 1 | is.na(intervention_ranking)) 
        
        
        components          <- inner_working_graph %>%
                                    calculate_component_stats() 
        
        
        components %>%
          mutate(intervention_ranking = rank)
      }
    ) %>%
    dplyr::bind_rows() %>%
    dplyr::mutate(
                  intervention_priority = intervention_priority_input,
                  intervention_stratification = intervention_stratification_input
    ) %>% 
    dplyr::select(intervention_ranking, names(.)) %>%
    dplyr::mutate(n_vaccinated = total_participants - n_lcc - n_remainder) %>%
    tidyr::pivot_longer(c(n_lcc, n_remainder, n_vaccinated), names_to = "group", values_to = "count") %>%
    dplyr::group_by(intervention_priority, intervention_stratification, intervention_ranking) %>%
    dplyr::mutate(proportion = count / sum(count)) %>%
    dplyr::ungroup()
  
}
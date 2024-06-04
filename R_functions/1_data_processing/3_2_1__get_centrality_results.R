get_centrality_results <- function(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "contact", intervention_stratification_input = "overall"){
  
  rankings_place <- intervention_coverage_data_sim[["place_coverage"]] %>%
                    filter(intervention_priority == intervention_priority_input) %>%
                    filter(strata == intervention_stratification_input) %>%
                    transmute(name = intervention_contact_place, intervention_ranking) %>%
                    arrange(intervention_ranking) 
  
  rankings_person <- intervention_coverage_data_sim[["person_coverage"]] %>%
                    filter(intervention_priority == intervention_priority_input) %>%
                    filter(strata == intervention_stratification_input) %>%
                    transmute(name = name, intervention_ranking) %>%
                    arrange(intervention_ranking)
  
  rankings <- rbind(rankings_place, rankings_person)
  
  reps <- intervention_coverage_data_sim[["place_coverage"]] %>%
                  pull(rep) %>%
                  max()
  
  working_graph <- bipartite_graph_sim %>%
                    left_join(rankings) %>%
                    select(name, intervention_ranking, type, rep)
  
  rankings %>%
    pull(intervention_ranking) %>%
    unique() %>%
    purrr::map(
      function(rank){
        
        working_graph %>%
          filter(intervention_ranking >= rank - 1 | is.na(intervention_ranking)) %>%
          calculate_component_stats() %>%
          mutate(intervention_ranking = rank)
        
        
      }
    ) %>%
    bind_rows() %>%
    mutate(
      intervention_priority = intervention_priority_input,
      intervention_stratification = intervention_stratification_input
    ) 
  
}
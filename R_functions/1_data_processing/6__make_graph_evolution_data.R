get_graph_evolution <- function(bipartite_graph_sim, intervention_coverage_data_sim, intervention_priority_input = "contact", intervention_stratification_input = "overall"){
  
  rankings <- intervention_coverage_data_sim[["place_coverage"]] %>%
    filter(intervention_priority == intervention_priority_input) %>%
    filter(intervention_stratification == intervention_stratification_input) %>%
    transmute(name = intervention_contact_place, intervention_ranking) %>%
    arrange(intervention_ranking)
  
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
          get_component_analysis() %>%
          mutate(intervention_ranking = rank)
        
        
      }
    ) %>%
    bind_rows() %>%
    mutate(
      intervention_priority = intervention_priority_input,
      intervention_stratification = intervention_stratification_input
    ) 
  
}
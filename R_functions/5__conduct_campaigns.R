conduct_campaigns <- function(bipartite_graph_sim, list_intervention_priority, list_intervention_settings, n_neighborhoods = 50){
  
  result <- list()
  
  counter <- 0
  
  for (intervention_priority in list_intervention_priority){
    for (intervention_setting in list_intervention_settings){
      
      counter             <- counter + 1
      
      result[[counter]]   <- bipartite_graph_sim %>%
        mark_n_neighborhoods( n_neighborhoods,  intervention_priority, intervention_setting, overall) 
      
      counter             <- counter + 1
      
      result[[counter]]   <- bipartite_graph_sim %>%
        mark_n_neighborhoods( n_neighborhoods,  intervention_priority, intervention_setting, demo_group) 
      
      
    }
  }
  
  result 
  
}

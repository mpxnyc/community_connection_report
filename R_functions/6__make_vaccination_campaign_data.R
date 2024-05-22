make_vaccination_campaign_data <- function(  bipartite_graph_sim, list_intervention_priority, list_intervention_settings, n_neighborhoods_input){
  

  conduct_campaigns(
    list_intervention_settings = list_intervention_settings,
    list_intervention_priority = list_intervention_priority, 
    bipartite_graph_sim        = bipartite_graph_sim, 
    n_neighborhoods            = n_neighborhoods_input
  )
  
  
}
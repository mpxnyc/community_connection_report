mark_top_neighborhoods <- function(bipartite_graph_sim_ranked, top_neighborhoods, intervention_setting_input){
  
  to_be_marked <- bipartite_graph_sim_ranked %>%
    activate(edges) %>%
    filter(intervention_setting %in% intervention_setting_input) %>%
    activate(nodes) %>%
    filter(is.na(intervention_ranking)) %>%
    igraph::neighborhood(nodes = top_neighborhoods) %>%
    unlist() %>%
    names() %>%
    unique()
  
  
  
  current_top_rank    <- attr(bipartite_graph_sim_ranked, "top_rank") 
  next_top_rank       <- current_top_rank + 1
  
  result <- bipartite_graph_sim_ranked %>%
    activate(nodes) %>%
    mutate(intervention_ranking = ifelse(name %in% to_be_marked, next_top_rank, intervention_ranking))
  
  attr(result, "top_rank") <- next_top_rank
  
  result
  
}

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
  
  
  
  
  vax_places <- bipartite_graph_sim_ranked %>%
    activate(nodes) %>%
    filter(name %in% to_be_marked) %>%
    activate(edges) %>%
    mutate(name = .N()$name[from], place = .N()$name[to]) %>%
    data.frame()
  
  vax_places_vec <- vax_places$place
  names(vax_places_vec) <- vax_places$name

  
  
  
  current_top_rank    <- attr(bipartite_graph_sim_ranked, "top_rank") 
  next_top_rank       <- current_top_rank + 1
  
  result <- bipartite_graph_sim_ranked %>%
    activate(nodes) %>%
    mutate(intervention_ranking = ifelse(name %in% to_be_marked, next_top_rank, intervention_ranking)) %>%
    mutate(vax_place = ifelse(name %in% to_be_marked, vax_places_vec[name], vax_place))
  
  attr(result, "top_rank") <- next_top_rank
  
  result
  
}

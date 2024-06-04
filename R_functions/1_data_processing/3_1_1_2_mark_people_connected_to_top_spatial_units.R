mark_people_connected_to_top_spatial_units <- function(bipartite_graph, top_neighborhoods){
  
  places_and_people_to_be_marked       <- bipartite_graph %>%
                                            activate(nodes) %>%
                                            filter(is.na(intervention_ranking)) %>%
                                            igraph::neighborhood(nodes = top_neighborhoods) %>%
                                            unlist() %>%
                                            names() %>%
                                            unique()
  
  
  helper_get_intervention_contact_place <- function(name){
    vax_places         <- bipartite_graph %>%
                              activate(nodes) %>%
                              filter(name %in% places_and_people_to_be_marked) %>%
                              activate(edges) %>%
                              mutate(name = .N()$name[from], place = .N()$name[to]) %>%
                              data.frame()
    
    vax_places_vec <- vax_places$place
    names(vax_places_vec) <- vax_places$name
    
    vax_places_vec[name]
  }

  current_top_rank    <- attr(bipartite_graph, "top_rank") 
  next_top_rank       <- current_top_rank + 1
  
  print(next_top_rank)
  
  result <- bipartite_graph %>%
              activate(nodes) %>%
              mutate(intervention_ranking = ifelse(name %in% places_and_people_to_be_marked, next_top_rank, intervention_ranking)) %>%
              mutate(intervention_contact_place = ifelse(name %in% places_and_people_to_be_marked, helper_get_intervention_contact_place(name), intervention_contact_place))
  
  attr(result, "top_rank") <- next_top_rank
  
  result
  
}

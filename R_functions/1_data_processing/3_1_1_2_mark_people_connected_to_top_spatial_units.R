mark_people_connected_to_top_spatial_units <- function(bipartite_graph, top_neighborhoods){
  
  places_and_people_to_be_marked       <- bipartite_graph %>%
                                            tidygraph::activate(nodes) %>%
                                            tidygraph::filter(is.na(intervention_ranking)) %>%
                                            igraph::neighborhood(nodes = top_neighborhoods) %>%
                                            unlist() %>%
                                            names() %>%
                                            unique()
  
  
  helper_get_intervention_contact_place <- function(input_name){
    
    # Remember in each realization there is only one top place. Each person node will only have one tie
    
    vax_places            <- bipartite_graph %>%
                                    tidygraph::activate(nodes) %>%
                                    tidygraph::filter(name %in% places_and_people_to_be_marked) %>%
                                    tidygraph::activate(edges) %>%
                                    tidygraph::mutate(name = .N()$name[from], place = .N()$name[to]) %>%
                                    data.frame()
    
    vax_places_vec        <- vax_places$place
    names(vax_places_vec) <- vax_places$name
    
    vax_places_vec[input_name]
  }

  current_top_rank    <- attr(bipartite_graph, "top_rank") 
  next_top_rank       <- current_top_rank + 1
  
  
  result <- bipartite_graph %>%
              tidygraph::activate(nodes) %>%
              tidygraph::mutate(intervention_ranking = ifelse(name %in% places_and_people_to_be_marked, next_top_rank, intervention_ranking)) %>%
              tidygraph::mutate(intervention_contact_place = ifelse(name %in% places_and_people_to_be_marked, helper_get_intervention_contact_place(name), intervention_contact_place))
  
  attr(result, "top_rank") <- next_top_rank
  
  result
  
}

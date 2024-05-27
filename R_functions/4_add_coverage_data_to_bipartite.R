add_coverage_data_to_bipartite <- function(graph){
  
  intervention_contact_places <- graph %>%
                                    activate(nodes) %>%
                                    mutate(node_degree = igraph::degree(.)) %>%
                                    activate(edges) %>%
                                    mutate(place_degree = .N()$node_degree[to]) %>%
                                    mutate(place_name = .N()$name[to]) %>%
                                    mutate(person_name = .N()$name[from]) %>%
                                    select(from, to, place_degree, place_name, person_name) %>%
                                    arrange(person_name, -place_degree) %>%
                                    group_by(person_name) %>%
                                    mutate(intra_person_place_ranking = 1:n()) %>%
                                    ungroup() %>%
                                    filter(intra_person_place_ranking == 1) %>%
                                    data.frame() %>%
                                    transmute(name = person_name, intervention_contact_place = place_name)
  
  graph %>%
    activate(nodes) %>%
    left_join(intervention_contact_places)
  
}
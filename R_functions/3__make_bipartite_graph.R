make_bipartite_graph <- function(place_data, participant_data, analytic_scale = "neighborhood"){
  
  place_edges                 <- place_data %>%
                                    dplyr::rename(from = userId) %>%
                                    dplyr::mutate(to = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractPlace, convert_to = analytic_scale)) %>%
                                    dplyr::select(from, to, names(.)) %>%
                                    dplyr::mutate(home = FALSE)
  
  home_edges                  <- participant_data %>%
                                    dplyr::transmute(
                                              from                 = userId, 
                                              to                   = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractHome, convert_to = analytic_scale),
                                              intervention_setting = "home", 
                                              placeSex             = "home", 
                                              placeType            = "home"
                                              )  %>%
                                    dplyr::mutate(home = TRUE)
  
  edges                      <- list(place_edges, home_edges) %>%
                                   dplyr::bind_rows() 
  
  
  person_nodes               <- participant_data %>%
                                    dplyr::rename(name = userId) %>%
                                    dplyr::select(name, names(.)) %>%
                                    dplyr::mutate(type = TRUE)
  
  place_nodes                <- edges %>%
                                    dplyr::transmute(name = to) %>%
                                    unique() %>%
                                    dplyr::mutate(type = FALSE)
  
  
  nodes                      <- list(person_nodes, place_nodes) %>%
                                   dplyr::bind_rows()
  
  
  tidygraph::tbl_graph(nodes = nodes, edges = edges, node_key = "name")

  
}


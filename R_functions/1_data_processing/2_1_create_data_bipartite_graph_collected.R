create_data_bipartite_graph_collected <- function(place_data, participant_data, analytic_scale = "neighborhood"){
  
  if (analytic_scale == "neighborhood"){
    
    n_spatial_units <- dim(mpxnyc::neighborhood_sf_obj)[1]
    
  } else if (analytic_scale == "community"){
    
    n_spatial_units <- dim(mpxnyc::community_sf_obj)[1]
    
  } else if (analytic_scale == "borough"){
    
    n_spatial_units <- dim(mpxnyc::borough_sf_obj)[1]
    
  } else if (analytic_scale == "census_tract"){
    n_spatial_units <- dim(mpxnyc::census_tract_sf_obj)[1]
  }
  
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
  
  
  graph <- tidygraph::tbl_graph(nodes = nodes, edges = edges, node_key = "name") %>%
                  activate(nodes) %>%
                  mutate(rep = 1)
  
  attr(graph, "n_spatial_units") <- n_spatial_units
  
  graph
  
}


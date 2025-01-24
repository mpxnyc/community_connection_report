create_data_bipartite_graph_collected <- function(place_data, participant_data, initial_settings){
  
  analytic_scale = initial_settings[["analytic_scale"]]
  
  if (analytic_scale == "neighborhood"){
    
    n_spatial_units <- dim(mpxnyc::neighborhood_sf_obj)[1]
    
  } else if (analytic_scale == "community"){
    
    n_spatial_units <- dim(mpxnyc::community_sf_obj)[1]
    
  } else if (analytic_scale == "borough"){
    
    n_spatial_units <- dim(mpxnyc::borough_sf_obj)[1]
    
  } else if (analytic_scale == "census_tract"){
    n_spatial_units <- dim(mpxnyc::census_tract_sf_obj)[1]
  }
  
  place_edges                 <- place_data |>
                                    dplyr::rename(from = userId) |>
                                    dplyr::mutate(to = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractPlace, convert_to = analytic_scale)) |>
                                    {function(x) dplyr::select(x, from, to, names(x))}() |>
                                    dplyr::mutate(home = FALSE)
  
  home_edges                  <- participant_data |>
                                    dplyr::transmute(
                                              from                 = userId, 
                                              to                   = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractHome, convert_to = analytic_scale),
                                              intervention_setting = "home", 
                                              placeSex             = "home", 
                                              placeType            = "home"
                                              )  |>
                                    dplyr::mutate(home = TRUE)
  
  edges                      <- list(place_edges, home_edges) |>
                                   dplyr::bind_rows() 
  
  
  
  
  person_nodes               <- participant_data |>
                                    dplyr::mutate(name = userId) |>
                                    {function(x) dplyr::select(x, name, names(x))}() |>
                                    dplyr::mutate(type = TRUE)
  
  place_nodes                <- edges |>
                                    dplyr::mutate(name = to) |>
                                    unique() |>
                                    dplyr::mutate(type = FALSE) |>
                                    dplyr::select(name, type)
  
  
  nodes                      <- list(person_nodes, place_nodes) |>
                                   dplyr::bind_rows()
  
  labelled::var_label(nodes)           <- labelled::var_label(person_nodes)
  labelled::var_label(edges)           <- labelled::var_label(place_edges)
  
  graph <- tidygraph::tbl_graph(nodes = nodes, edges = edges, node_key = "name") |>
                  tidygraph::activate(nodes) |>
                  dplyr::mutate(rep = 1)
  
  attr(graph, "n_spatial_units") <- n_spatial_units
  
  graph
  
}


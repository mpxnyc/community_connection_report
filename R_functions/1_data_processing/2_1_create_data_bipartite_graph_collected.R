create_data_bipartite_graph_collected <- function(place_data, participant_data, config_list){
  
  analytic_scale = config_list[[1]][["settings"]][["analytic_scale"]]
  
  
  place_edges                 <- place_data |>
    dplyr::rename(from = userId) |>
    dplyr::mutate(home = FALSE)
  
  home_edges                  <- participant_data |>
    dplyr::mutate(
      from                 = userId, 
      intervention_setting = "home", 
      placeSex             = "home", 
      placeType            = "home"
    )  |>
    dplyr::mutate(home = TRUE)
  
  
  
  
  if (analytic_scale == "neighborhood"){
    
    n_spatial_units <- dim(mpxnyc::neighborhood_sf_obj)[1]
    place_edges     <- place_edges |> dplyr::mutate(to = place_neighborhood)
    home_edges      <- home_edges  |> dplyr::mutate(to = neighborhood)
    
  } else if (analytic_scale == "community"){
    
    n_spatial_units <- dim(mpxnyc::community_sf_obj)[1]
    place_edges     <- place_edges |> dplyr::mutate(to = place_community)
    home_edges      <- home_edges  |> dplyr::mutate(to = community)
    
  } else if (analytic_scale == "borough"){
    
    n_spatial_units <- dim(mpxnyc::borough_sf_obj)[1]
    place_edges     <- place_edges |> dplyr::mutate(to = place_borough)
    home_edges      <- home_edges  |> dplyr::mutate(to = borough)
    
  } else if (analytic_scale == "census_tract"){
    n_spatial_units <- dim(mpxnyc::census_tract_sf_obj)[1]
    place_edges     <- place_edges |> dplyr::mutate(to = censusTractPlace)
    home_edges      <- home_edges  |> dplyr::mutate(to = censusTractHome)
  }
  
  
  
  
  edges                      <- list(place_edges, home_edges) |>
                                          dplyr::bind_rows() |>
                                          dplyr::filter(!is.na(to) & !is.na(from))
  
  
  person_nodes               <- participant_data |>
                                          dplyr::mutate(name = userId) |>
                                          {function(x) dplyr::select(x, name, names(x))}() |>
                                          dplyr::mutate(type = TRUE) |>
                                          dplyr::filter(!is.na(community))
  
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


make_bipartite_graph <- function(place_data, participant_data, analytic_scale = "neighborhood"){
  
  place_edges                 <- place_data %>%
                                    dplyr::rename(from = userId) %>%
                                    dplyr::mutate(to = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractPlace, convert_to = analytic_scale)) %>%
                                    dplyr::select(from, to, names(.))
  
  home_edges                  <- participant_data %>%
                                    dplyr::transmute(
                                              from                 = userId, 
                                              to                   = mpxnyc::convert_spatial_unit_ny(input_census_tract = censusTractHome, convert_to = analytic_scale),
                                              intervention_setting = "home", 
                                              placeSex             = "home", 
                                              placeType            = "home"
                                              ) 
  
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



if (FALSE) {
  
  dirty_data_participants <- readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_person_data.R")
  dirty_data_places       <- readRDS("/Users/keletso/Documents/_data/mpxnyc/mpxnyc_place_data.R")


  participant_data        <- clean_participant_data(
                                                  raw_data_participants = dirty_data_participants
                                                  )

  places_data             <- clean_place_data(
                                             raw_data_places = dirty_data_places
                                             )
                                             
  make_bipartite_graph(places_data, participant_data)
}
  

make_place_data_by_distanceFromHome <- function(bipartite_graph_sim) {
  
  
  placeType_levels <- c(
    "dance-party",
    "concert",
    "theatre/show",
    "sport-game",
    "darkroom",
    "sex-party",
    "private-residence-",
    "something-else"
  )
  
  placeType_labels <- c(
    "Dance Party",
    "Concert/Theatre/Show",
    "Concert/Theatre/Show",
    "Sport Game",
    "Dark Room/Sex Party",
    "Dark Room/Sex Party",
    "Private Residence",
    "Something Else"
  )
  
  placeSex_levels <- c(
    "yes",
    "no"
  )
  
  placeSex_labels <- c(
    "Sexual Contact Venues",
    "Social Contact Venues"
  )
  
  
  
  bipartite_graph_sim %>%
    activate(edges) %>%
    filter(placeSex != "home") %>%
    mutate(placeSex = factor(placeSex, placeSex_levels, placeSex_labels)) %>%
    mutate(placeType = factor(placeType, placeType_levels, placeType_labels)) %>%
    make_table_1_datatable(
                            by = c(distanceFromHome, placeSex), 
                            variables = placeType,
                            person_data = FALSE
                            ) 
}
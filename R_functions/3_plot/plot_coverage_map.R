plot_coverage_map        <- function(data){
  
  map_object <- mpxnyc::community_sf_obj |>
    sf::st_as_sf() |>
    dplyr::filter(!stringr::str_detect(community, "SI")) |>
    dplyr::rename(name = 1) |>
    dplyr::left_join(data, by = "name") 
  
  map_object |>
    ggplot2::ggplot() +
    ggplot2::geom_sf(fill = "grey", color = "white") +
    ggplot2::geom_sf(ggplot2::aes(fill = group), color = "white", linewidth = 0.5) 

}
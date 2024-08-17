plot_map_choro        <- function(data, fill){
  
  map_object <- mpxnyc::community_sf_obj %>%
    dplyr::rename(level = 1) %>%
    dplyr::left_join(data, by = "level")
  
  map_object %>%
    ggplot() +
    geom_sf(fill = "grey") +
    geom_sf(aes(fill = {{fill}}), color = "black") 

}
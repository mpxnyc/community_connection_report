plot_coverage_map        <- function(data){
  
  map_object <- mpxnyc::community_sf_obj %>%
    dplyr::rename(level = 1) %>%
    dplyr::left_join(data) 
  
  map_object %>%
    ggplot() +
    geom_sf(fill = "grey") +
    geom_sf(aes(fill = group), color = "black") +
    theme_void() +
    theme(
      axis.text = element_blank(),
      legend.position = "bottom"
    ) 
}
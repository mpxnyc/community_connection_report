plot_coverage_map        <- function(data){
  
  map_object <- mpxnyc::community_sf_obj %>%
    filter(!stringr::str_detect(community, "SI")) %>%
    dplyr::rename(name = 1) %>%
    dplyr::left_join(data, by = "name") 
  
  map_object %>%
    ggplot() +
    geom_sf(fill = "grey") +
    geom_sf(aes(fill = group), color = "black") 

}
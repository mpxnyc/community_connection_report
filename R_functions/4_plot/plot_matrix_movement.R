



plot_matrix_movement    <- function(data){
  
  data_tiles <- mpxnyc::community_sf_obj %>%
    dplyr::transmute(to = community, from = community) %>%
    tidyr::expand(to, from) %>%
    mutate(from_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = from, convert_to = "borough")) %>%
    mutate(to_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = to, convert_to = "borough"))
  
  data  %>% 
    mutate(from_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = from, convert_to = "borough")) %>%
    mutate(to_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = to, convert_to = "borough")) %>%
    ggplot2::ggplot() +
    ggplot2::geom_tile(
      aes(y =from, x = to, fill = from_borough), 
      data = data_tiles,
      alpha = 0.2
    ) +
    ggplot2::geom_point(
      aes(y =from, x = to, size = weight, color = to_borough)
    ) 
}
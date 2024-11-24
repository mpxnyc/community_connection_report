



plot_matrix_movement    <- function(data){
  
  # data_tiles <- mpxnyc::community_sf_obj %>%
  #   dplyr::transmute(to = community, from = community) %>%
  #   tidyr::expand(to, from) %>%
  #   mutate(from_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = from, convert_to = "borough")) %>%
  #   mutate(to_borough = mpxnyc::convert_spatial_unit_ny(input_community_district = to, convert_to = "borough"))
  
  ggplot(data) +
    geom_tile(aes(y = from, x = to, fill = from_borough), alpha = 0.3) +
    geom_point(aes(y = from, x = to, col = to_borough, size = weight)) +
    theme_void() +
    theme(
      legend.position = "none",
      axis.text = element_text(),
      axis.text.x = element_text(angle = 90)
    ) +
    scale_x_discrete(position = "top") +
    scale_y_discrete(position = "left") 
}
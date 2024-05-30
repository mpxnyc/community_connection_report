plot_matrix_mixing         <- function(data){
  
  
  
  data %>%
    ggplot() +
    geom_tile(aes(y = from_level, x = to_level, fill = bias), color = "black") +
    theme_void() +
    theme(
      axis.text.x = element_text(),
      axis.text.y = element_text(),
      axis.title = element_blank()
    ) +
    scale_x_discrete(drop = FALSE) +
    scale_x_discrete(drop = FALSE) 
}
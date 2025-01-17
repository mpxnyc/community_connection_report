



plot_matrix_movement    <- function(data){
  
  ggplot2::ggplot(data) +
    ggplot2::geom_tile(ggplot2::aes(y = from, x = to, fill = from_borough), alpha = 0.3) +
    ggplot2::geom_point(ggplot2::aes(y = from, x = to, col = to_borough, size = weight)) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "none",
      axis.text = ggplot2::element_text(),
      axis.text.x = ggplot2::element_text(angle = 90)
    ) +
    ggplot2::scale_x_discrete(position = "top") +
    ggplot2::scale_y_discrete(position = "left") 
}
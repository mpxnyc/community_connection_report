plot_matrix_movement    <- function(data){
  
  ggplot2::ggplot(data) +
    ggplot2::geom_tile(ggplot2::aes(y = from, x = to, fill = from_borough), alpha = 0.3) +
    ggplot2::geom_point(ggplot2::aes(y = from, x = to, col = to_borough, size = weight)) 
}
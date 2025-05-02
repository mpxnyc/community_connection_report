plot_matrix_movement    <- function(data){
  
  data_reduced <- data |>
    dplyr::select(from, to, from_borough, to_borough) |>
    unique()
  
  from_borough <- data_reduced |>
    dplyr::select(from, from_borough) |>
    unique()
  
  to_borough <-   data_reduced |>
    dplyr::select(to, to_borough) |>
    unique() |>
    dplyr::rename(from = to, from_borough = to_borough)
  
  borough <- from_borough |>
    rbind(to_borough) |>
    unique()
  
  
  name_table <- borough |>
    dplyr::mutate(from = from, from2 = from) |>
    tidyr::expand(from, from2) |>
    unique() |>
    dplyr::left_join(borough) |>
    dplyr::rename(to = from2)
  
  ggplot2::ggplot() +
    ggplot2::geom_tile(ggplot2::aes(y = from, x = to, fill = from_borough), alpha = 0.2, data = name_table, color = "white", size = 0.5) +
    #ggplot2::geom_point(ggplot2::aes(y = from, x = to, col = to_borough, size = 12), alpha = 0.2) +
    ggplot2::geom_point(ggplot2::aes(y = from, x = to, col = to_borough, size = weight), data = data) 
}
plot_radar_stratified   <- function(data){
  
  data_n_counts <- data |>
    dplyr::group_by(stratum) |>
    dplyr::summarize(n = sum(count))
  
  
  data |>
    dplyr::mutate(prop_label = scales::percent(proportion, accuracy = 1)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      ggplot2::aes(x = level, y = proportion, fill = level), 
      stat   = "identity", 
      width  = 1, 
      color  = "black"
    ) +
    ggplot2::geom_text(
      ggplot2::aes(x = 0, y = -0.8, label = paste("n =", n)), 
      data  = data_n_counts, 
      size  = 5
    ) +
    ggplot2::geom_text(
      ggplot2::aes(label = prop_label, x = level, y = proportion + 0.3), 
      size  = 3, 
      face  = "bold", 
      alpha = 0.7
    ) +
    ggplot2::facet_grid( . ~ stratum, switch = "y") +
    ggplot2::coord_polar(clip = FALSE) 
}
plot_radar_grid       <- function(data){
  data |>
    dplyr::filter(!is.na(stratum)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      ggplot2::aes(x = level, y = proportion, fill = level), 
      stat = "identity",
      width = 1, 
      color = "black"
    ) +
    ggplot2::facet_wrap(. ~ stratum) +
    ggplot2::coord_polar() +
    ggplot2::theme_void()  
}
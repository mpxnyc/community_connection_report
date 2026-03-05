plot_radar_grid       <- function(data){
  
  if (is.null(data[["stratum"]])) {
    working_data <- data |>
      dplyr::mutate(stratum = "overall")
  } else {
    working_data <- data
  }
  
  working_data |>
    dplyr::filter(!is.na(stratum)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      ggplot2::aes(x = level, y = proportion, fill = level), 
      stat = "identity",
      width = 1, 
      color = "black"
    ) +
    ggplot2::facet_wrap(. ~ stratum, labeller = ggplot2::label_wrap_gen(width = 10)) +
    ggplot2::coord_polar() +
    ggplot2::theme_void()  
}
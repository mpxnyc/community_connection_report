plot_radar_stratified   <- function(data){
  
  data_n_counts <- data |>
    dplyr::group_by(stratum) |>
    dplyr::summarize(n = sum(count))
  
  
  data |>
    dplyr::mutate(prop_label = scales::percent(proportion, accuracy = 1)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      aes(x = level, y = proportion, fill = level), 
      stat   = "identity", 
      width  = 1, 
      color  = "black"
    ) +
    ggplot2::geom_text(
      aes(x = 0, y = -0.8, label = paste("n =", n)), 
      data  = data_n_counts, 
      size  = 5
    ) +
    ggplot2::geom_text(
      aes(label = prop_label, x = level, y = proportion + 0.3), 
      size  = 3, 
      face  = "bold", 
      alpha = 0.7
    ) +
    ggplot2::facet_grid( . ~ stratum, switch = "y") +
    ggplot2::coord_polar(clip = FALSE) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "bottom",
      strip.text      = ggplot2::element_text( hjust = 0.5),
      strip.text.y    = ggplot2::element_text(),
      plot.title      = ggplot2::element_text(hjust = 0.5),
      plot.subtitle   = ggplot2::element_text(hjust = 0.5, margin = margin(1, 0, 15, 0, "mm")),
      plot.caption    = ggplot2::element_text( hjust = 0)
    ) +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1))
}


plot_radar_stratified2   <- function(data){
  
  
  data_n_counts <- data |>
    dplyr::group_by(stratum_a, stratum_b) |>
    dplyr::summarize(n = sum(count))
  
  
  data |>
    dplyr::mutate(prop_label = scales::percent(proportion, accuracy = 1)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(ggplot2::aes(x = level, y = proportion, fill = level), stat = "identity", width = 1, color = "black") +
    ggplot2::geom_text(ggplot2::aes(x = 0, y = -0.8, label = paste("n =", n)), data = data_n_counts, size = 5) +
    ggplot2::geom_text(ggplot2::aes(label = prop_label, x = level, y = proportion + 0.3), size = 3, face = "bold", alpha = 0.7) +
    ggplot2::facet_grid( stratum_a ~ stratum_b, switch = "y") +
    ggplot2::coord_polar(clip = FALSE) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "bottom",
      strip.text    = ggplot2::element_text( hjust = 0.5, size = 10),
      strip.text.y  = ggplot2::element_text(angle =90),
      plot.title    = ggplot2::element_text(hjust = 0.5),
      plot.subtitle = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(1, 0, 15, 0, "mm")),
      plot.caption  = ggplot2::element_text( hjust = 0)
    ) +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1))
}



plot_radar_grid       <- function(data){
  data |>
    dplyr::filter(!is.na(stratum)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      aes(x = level, y = proportion, fill = level), 
      stat = "identity",
      width = 1, 
      color = "black"
    ) +
    ggplot2::facet_wrap(. ~ stratum) +
    ggplot2::coord_polar() +
    ggplot2::theme_void()  +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.5, 1))
}
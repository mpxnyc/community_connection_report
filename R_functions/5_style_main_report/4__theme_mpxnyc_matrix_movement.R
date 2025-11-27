theme_mpxnyc_matrix_movement <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text         = ggplot2::element_text(size = 8),
      axis.text.x       = ggplot2::element_text(angle = 90),
      legend.direction  = "vertical",
      legend.box.margin = ggplot2::unit(c(30,30,30,30), "pt"),
      legend.position = "bottom",
      plot.margin = ggplot2::unit(c(0,0,0,0), "cm")
    ) +
    ggplot2::theme(...)
}

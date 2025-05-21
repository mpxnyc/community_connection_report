theme_mpxnyc_bar_places <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      axis.text.x     = ggplot2::element_text(),
      panel.spacing   = ggplot2::unit(30, "pt"),
      panel.grid.major.x      = ggplot2::element_line(color = "darkgrey", size = 0.3)
    ) +
    ggplot2::theme(...)
}
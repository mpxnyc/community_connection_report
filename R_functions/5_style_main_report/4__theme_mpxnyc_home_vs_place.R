theme_mpxnyc_home_vs_place <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text          = ggplot2::element_text(size = 8),
      axis.text.x        = ggplot2::element_text(angle = 0, size = 10),
      panel.grid.major.x = ggplot2::element_line(size = 0.2, color = "darkgrey"),
      panel.grid.minor.x = ggplot2::element_line(size = 0.2, color = "darkgrey"),
      legend.margin      = ggplot2::margin(40, 40, 40, 40),
      legend.position    = "bottom"
    ) +
    ggplot2::theme(...)
}
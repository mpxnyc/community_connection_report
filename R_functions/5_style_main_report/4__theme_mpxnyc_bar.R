theme_mpxnyc_bar <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      panel.grid.major.y  = ggplot2::element_line(),
      axis.title.y        = ggplot2::element_text( size = 15, margin = ggplot2::margin(0, 30, 0, 0)),
      axis.text.y         = ggplot2::element_text(size = 15),
      axis.text.x         = ggplot2::element_text(angle = 90, hjust = 1, size = 15),
      legend.position     = "none"
    ) +
    ggplot2::theme(...)
}
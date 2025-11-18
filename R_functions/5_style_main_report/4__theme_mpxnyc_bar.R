theme_mpxnyc_bar <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      panel.grid.major.y  = ggplot2::element_line(),
      axis.title.y        = ggplot2::element_text(),
      axis.text.y         = ggplot2::element_text(),
      axis.text.x         = ggplot2::element_text(angle = 45, hjust = 1),
      legend.position     = "none"
    ) +
    ggplot2::theme(...)
}
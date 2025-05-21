theme_mpxnyc_bar <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      panel.grid.major.y  = ggplot2::element_line(),
      axis.title.y        = ggplot2::element_text(),
      axis.text.y         = ggplot2::element_text(),
      legend.position     = "right"
    ) +
    ggplot2::theme(...)
}
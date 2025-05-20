theme_mpxnyc_blank <- function(...){
  ggplot2::theme(
    axis.text              = ggplot2::element_blank(),
    axis.title             = ggplot2::element_blank(),
    axis.ticks             = ggplot2::element_blank(),
    legend.position        = "none",
    panel.grid             = ggplot2::element_blank(),
    panel.spacing          = ggplot2::unit(0, "pt"),
    legend.text            = ggplot2::element_text(size = 12),
    legend.margin          = ggplot2::margin(40,10,10,10),
    plot.margin            = ggplot2::unit(c(0, 1.5, 0, 1.5), "cm"),
    plot.title             = ggplot2::element_text(hjust = 0.5),
    strip.background       = ggplot2::element_blank(),
    strip.text             = ggplot2::element_text(size = 13, margin = ggplot2::margin(40,40,40,40)),
    strip.text.y.left      = ggplot2::element_text(angle = 0),
    panel.background       = ggplot2::element_blank()
  ) +
    ggplot2::theme(...)
}
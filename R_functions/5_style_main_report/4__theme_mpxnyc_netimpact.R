theme_mpxnyc_netimpact <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      axis.text = ggplot2::element_text(),
      legend.text = ggplot2::element_text(size = 9),
      plot.margin = ggplot2::unit(c(0,0,0,0), "pt"),
      legend.box.margin = ggplot2::unit(c(30, 30,30,30), "pt")
    ) +
    ggplot2::theme(...)
}
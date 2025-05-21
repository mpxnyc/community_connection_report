theme_mpxnyc_radar_places <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      panel.spacing   = ggplot2::unit(30, "pt")
    ) +
    ggplot2::theme(...)
}
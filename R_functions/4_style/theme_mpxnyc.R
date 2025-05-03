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
      plot.margin            = ggplot2::unit(c(1.5, 1.5, 1.5, 1.5), "cm"),
      strip.background       = ggplot2::element_blank(),
      strip.text             = ggplot2::element_text(size = 13, margin = ggplot2::margin(40,40,40,40)),
      strip.text.y.left      = ggplot2::element_text(angle = 0),
      panel.background       = ggplot2::element_blank()
    ) +
    ggplot2::theme(...)
}

theme_mpxnyc_mixing <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text.y              = ggplot2::element_text(size = 12,  vjust = 0.5, hjust = 1),
      axis.text.x              = ggplot2::element_text(angle = -90, size = 12, hjust = 0, vjust = 0.5)
      ) +
    ggplot2::theme(...)
  
}

theme_mpxnyc_radar_people <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      plot.margin = ggplot2::unit(c(3,2,3,2), "cm")
    ) +
    ggplot2::theme(...)
}

theme_mpxnyc_radar_places <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      axis.text.x     = ggplot2::element_text(),
      panel.spacing   = ggplot2::unit(30, "pt"),
      panel.grid.major.x      = ggplot2::element_line(color = "darkgrey", size = 0.3)
    ) +
    ggplot2::theme(...)
}

theme_mpxnyc_matrix_movement <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text         = ggplot2::element_text(size = 8),
      axis.text.x       = ggplot2::element_text(angle = 90),
      legend.direction  = "vertical",
      legend.box.margin = ggplot2::unit(30, "pt"),
      legend.position = "bottom",
      plot.margin = ggplot2::unit(c(0,0,0,0), "cm")
    ) +
    ggplot2::theme(...)
}


theme_mpxnyc_home_vs_place <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text          = ggplot2::element_text(size = 8),
      axis.text.x        = ggplot2::element_text(angle = 0, size = 10),
      panel.grid.major.x = ggplot2::element_line(size = 0.2, color = "darkgrey"),
      panel.grid.minor.x = ggplot2::element_line(size = 0.2, color = "darkgrey"),
      legend.margin      = ggplot2::margin(40, 40, 40, 40),
      legend.position    = "right"
    ) +
    ggplot2::theme(...)
}

theme_mpxnyc_netimpact <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      legend.position = "bottom",
      axis.text = ggplot2::element_text(),
      legend.text = ggplot2::element_text(size = 12),
      plot.margin = ggplot2::unit(c(0,0,0,0), "pt"),
      legend.box.margin = ggplot2::unit(c(30, 30,30,30), "pt")
    ) +
    ggplot2::theme(...)
}


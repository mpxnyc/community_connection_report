theme_mpxnyc_mixing <- function(...){
  theme_mpxnyc_blank() +
    ggplot2::theme(
      axis.text.y              = ggplot2::element_text(size = 15,  vjust = 0.5, hjust = 0.5),
      axis.text.x              = ggplot2::element_text(angle = -90, size = 15, hjust = 0.5, vjust = 0.5),
      legend.position          = "bottom",
      legend.title             = ggplot2::element_text( margin = ggplot2::margin(0, 0, 10, 0), hjust = 1),
      legend.text              = ggplot2::element_text(size = 10),
      legend.title.position    = "left"
    ) +
    ggplot2::theme(...)
  
}
apply_style_radar_facet_plot <- function(plot, caption_hjust = 0){
  
  mpxnyc_colors       <- targets::tar_read(mpxnyc_colors)
  mpxnyc_all_colors   <- mpxnyc_colors[["all_colors"]]
  
  plot +
    ggplot2::theme_void() +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1)) +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1)) +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.8, 1)) +
    ggplot2::scale_fill_manual("", values = mpxnyc_all_colors) +
    ggplot2::theme(
                  legend.position = "bottom",
                  plot.title    = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm")),
                  plot.subtitle = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
                  plot.caption  = ggplot2::element_text( hjust = caption_hjust, margin = ggplot2::margin(1, 1, 1, 1, "cm")),
                  plot.margin   = ggplot2::margin(1,1,1,1, "cm"),
                  strip.text    = ggplot2::element_text( hjust = 0.5, size = 10),
                  strip.text.y  = ggplot2::element_text(angle =90),
                )
}
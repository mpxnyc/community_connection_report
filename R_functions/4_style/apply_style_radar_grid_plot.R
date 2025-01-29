apply_style_radar_grid_plot <- function(plot, caption_hjust = 0){
  
  mpxnyc_colors      <- targets::tar_read(config_list)[[1]][["content"]][["colors"]]
  mpxnyc_all_colors   <- mpxnyc_colors[["all_colors"]]
  
  plot +
    ggplot2::scale_y_continuous(breaks = c(0,0.25, 0.50, 1), limits = c(-0.5, 1)) +
    ggplot2::scale_fill_manual("", values = mpxnyc_all_colors) +
    ggplot2::theme(
                    legend.position = "bottom",
                    plot.caption  = ggplot2::element_text( hjust = caption_hjust, margin = ggplot2::margin(1, 1, 1, 1, "cm")),
                    plot.subtitle = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
                    plot.title    = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm")),
                    plot.margin   = ggplot2::margin(1,1,1,1, "cm")
                  )
}

apply_style_coverage_map <- function(plot, caption_hjust = 0){
  
  plot +
    ggplot2::theme_void() +
    ggplot2::scale_fill_manual("", values = c(dark_blue, dark_pink, light_blue), na.translate = FALSE) +
    ggplot2::theme(
                  axis.title.x       = ggplot2::element_text(angle = 90, margin = ggplot2::margin(0, 10, 0, 0, "mm")),
                  legend.position    = "none",
                  panel.margin       = ggplot2::margin(1,1,1,1, "cm"),
                  plot.background    = ggplot2::element_rect( fill = "transparent", color = "white"),
                  plot.caption       = ggplot2::element_text( hjust = caption_hjust),
                  plot.margin        = ggplot2::margin(30,30,10,30),
                  plot.subtitle      = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
                  plot.title         = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm"))
                )  
            }
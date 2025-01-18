apply_style_bar_plot <- function(plot, caption_hjust = 1){
  
  mpxnyc_colors     <- targets::tar_read(mpxnyc_colors)
  mpxnyc_all_colors <- mpxnyc_colors[["all_colors"]]
  
  plot +
    ggplot2::theme_void() +
    ggplot2::scale_x_discrete(drop = FALSE, labels = scales::label_wrap(10)) +
    ggplot2::scale_y_continuous("Proportion of participants", labels = scales::percent) +
    ggplot2::scale_fill_manual("", values = mpxnyc_all_colors) +
    ggplot2::theme(
                    axis.text.x        = ggplot2::element_text(size = 10),
                    axis.text.y        = ggplot2::element_text(margin = ggplot2::margin(0, 5, 0, 0, "mm")),
                    legend.position    = "none", 
                    panel.grid.major.y = ggplot2::element_line(size = 0.1),
                    panel.margin       = ggplot2::margin(1,1,5,1, "cm"),
                    plot.caption       = ggplot2::element_text(margin = ggplot2::margin(60, 0, 0, 0), hjust = caption_hjust),
                    plot.margin        = ggplot2::margin(1,1,1,1, "cm"),
                    plot.subtitle      = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
                    plot.title         = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm"))
                  )
}
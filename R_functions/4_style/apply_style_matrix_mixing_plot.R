apply_style_matrix_mixing_plot <- function(plot, caption_hjust = 0){
  
  mpxnyc_colors     <- targets::tar_read(config_list)[[1]][["content"]][["colors"]]
  dark_blue         <- mpxnyc_colors[["dark_blue"]]
  dark_pink         <- mpxnyc_colors[["dark_pink"]]
  
  plot +
    ggplot2::theme_void() +
    ggplot2::theme(
                    axis.text        = ggplot2::element_text(),
                    axis.title       = ggplot2::element_blank(),
                    legend.position  = "none",
                    panel.margin     = ggplot2::margin(1,1,1,1, "cm"),
                    plot.caption     = ggplot2::element_text( hjust = caption_hjust),
                    plot.title       = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm")),
                    plot.subtitle    = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
                    plot.margin      = ggplot2::margin(1,1,1,1, "cm")
                  ) +
    ggplot2::scale_fill_gradient2(low = dark_blue, high = dark_pink) +
    ggplot2::scale_color_gradient2(low = dark_blue, high = dark_pink) +
    ggplot2::scale_x_discrete(labels = scales::label_wrap(4), drop = TRUE, position = "top") +
    ggplot2::scale_y_discrete(labels = scales::label_wrap(4), drop = TRUE, limits = rev)
}
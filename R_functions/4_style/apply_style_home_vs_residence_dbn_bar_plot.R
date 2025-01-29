apply_style_home_vs_residence_dbn_bar_plot <- function(plot){
  
  mpxnyc_colors     <- targets::tar_read(config_list)[[1]][["content"]][["colors"]]
  
  dark_blue         <- mpxnyc_colors[["dark_blue"]]
  dark_pink         <- mpxnyc_colors[["dark_pink"]]
  dark_purple       <- mpxnyc_colors[["dark_purple"]]
  dark_green        <- mpxnyc_colors[["dark_green"]]
  dark_orange       <- mpxnyc_colors[["dark_orange"]]
  
  
  plot +
    ggplot2::scale_y_continuous(
                                "Proportion in community district", 
                                breaks = seq(-0.12,0.20, 0.02), 
                                limits = c(-0.07, 0.07), 
                                labels = function(x) {scales::percent((x))},
                              ) +
    ggplot2::scale_alpha_manual(
                                "Contact venues", 
                                values = c("highlight" = 1, "lowlight" = 0.4), 
                                labels = c(
                                  "highlight" = "Over-represented\nin community district\ncompared to residences", 
                                  "lowlight" = "Under-represented\nin community district\ncompared to residences"
                                )) +
    ggplot2::scale_fill_manual(
                                "Borough", 
                                values = c(dark_blue, dark_pink, dark_purple, dark_green, dark_orange)
                              ) +
    ggplot2::theme_void() +
    ggplot2::theme(
                        axis.text.x         = ggplot2::element_text(angle = 90, size = 7),
                        axis.text.y         = ggplot2::element_text(margin = ggplot2::margin(5,5,5,5)),
                        axis.title.y        = ggplot2::element_text(angle = 90),
                        legend.box          = "vertical",
                        legend.box.margin   = ggplot2::margin(1,1,1,1, "cm"),
                        legend.position     = "bottom",
                        panel.grid.major    = ggplot2::element_line(color = "lightgrey", size = 0.1),
                        plot.margin         = ggplot2::margin(15,15,15,15)
                  ) +
    ggplot2::guides( alpha = ggplot2::guide_legend(order = 2), fill = ggplot2::guide_legend(order = 1))
  
}
apply_style_home_vs_residence_dbn_bar_plot <- function(plot){
  
  plot +
    scale_y_continuous(
      "Proportion in community district", 
      breaks = seq(-0.12,0.20, 0.02), 
      limits = c(-0.06, 0.06), 
      labels = function(x) {scales::percent((x))},
    ) +
    scale_alpha_manual(
      "Contact venues", 
      values = c("contact_venue" = 1, "residence" = 0.4), 
      labels = c(
        "highlight" = "Over-represented\nin community district\ncompared to residences", 
        "lowlight" = "Under-represented\nin community district\ncompared to residences"
      )) +
    scale_fill_manual(
      "Borough", 
      values = c(dark_blue, dark_pink, dark_purple, dark_green, dark_orange)
    ) +
    theme_void() +
    theme(
      axis.text.x = element_text(angle = 90, size = 7),
      axis.text.y = element_text(margin = margin(5,5,5,5)),
      axis.title.y = element_text(angle = 90),
      plot.margin = margin(15,15,15,15),
      legend.position = "bottom",
      legend.box = "vertical",
      legend.box.margin = margin(1,1,1,1, "cm"),
      panel.grid.major = element_line(color = "lightgrey", size = 0.1)
    ) +
    guides( alpha = guide_legend(order = 2), fill = guide_legend(order = 1))
  
}
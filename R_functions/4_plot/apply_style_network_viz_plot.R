apply_style_network_viz <- function(plot){
  plot +
    scale_fill_manual("Borough", values = c(dark_pink, dark_blue, dark_purple, dark_green, dark_green)) +
    scale_color_manual("Borough", values = c(dark_pink, dark_blue, dark_purple, dark_green, dark_green)) +
    
    theme(
      legend.position = "right"
    ) +
    guides(color = guide_legend(), fill = "none", size = "none", edge_linewidth = "none")
}
style_ssnac_example <- function(plot){
  
  mpxnyc_colors <- targets::tar_read(config_list)[[1]][["content"]][["colors"]]
  
  edge_width_key    <- c("Employee" = 0.3, "Friend" = 0.3, "Neighbor" = 1.2, "Resident" = 1.5)
  edge_linetype_key <- c("Employee" = 1, "Friend" = 2, "Neighbor" = 2, "Resident" = 1)
  node_color_key    <- c("Person" = mpxnyc_colors$dark_pink, "Place" = "black")
  edge_color_key    <- c("Employee" = "#000000", "Friend" = "#000000", "Neighbor" = "#000000", "Resident" = mpxnyc_colors$mid_blue)
  
  plot +
    ggplot2::theme_void() +
    ggplot2::coord_fixed() +
    ggraph::scale_edge_linetype_manual("Edge type", values = edge_linetype_key ) +
    ggplot2::scale_color_manual("Node type", values = node_color_key) +
    ggraph::scale_edge_color_manual("Edge type", values =edge_color_key ) +
    ggplot2::theme(
      legend.margin = ggplot2::margin(15, 15, 15, 15),
    )
  
}
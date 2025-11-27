style_ssnac_example <- function(plot){
  

  plot +
    ggplot2::theme_void() +
    ggplot2::coord_fixed() +
    ggraph::scale_edge_linetype("Edge type") +
    ggplot2::scale_color_manual("Node type", values = node_color_key) +
    ggraph::scale_edge_color_manual("Edge type", values =edge_color_key ) +
    ggplot2::theme(
      legend.margin = ggplot2::margin(15, 15, 15, 15),
    )
  
}
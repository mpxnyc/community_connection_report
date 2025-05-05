data_snac_example <- function(){
  snacc_nodes <- data.frame(
    name = paste("node", 1:14, sep = "_"),
    node_type = c(rep("Person", 10), rep("Place", 4))
  )
  
  snacc_edges <- data.frame(
    from = c("node_1", "node_3", "node_4", "node_5", "node_11", "node_11", "node_12", "node_13", "node_11", "node_11", "node_11", "node_12", "node_13", "node_13", "node_13", "node_13", "node_14", "node_14", "node_11", "node_13"),
    to   = c("node_2", "node_6", "node_7", "node_8", "node_12", "node_13", "node_14", "node_14", "node_1", "node_3", "node_4", "node_2", "node_6", "node_7", "node_8", "node_9", "node_5", "node_10", "node_5", "node_5"),
    edge_type = c(rep("Friend", 4), rep("Neighbor", 4), rep("Resident", 10), rep("Employee", 2))
  ) 
  
  
  tidygraph::tbl_graph(nodes = snacc_nodes, edges = snacc_edges)
}

plot_ssnac_example <- function(){
  
  
  example_snacc_graph <- data_snac_example()
  
  coords <- data.frame(
    x = c(1, 1, 2, 2.5, 2.5, 3, 3.5, 3.5, 4, 4, 2, 2, 3, 3),
    y = c(2, 1, 3, 2.5, 1.5, 3, 2.5, 1.5, 2, 1, 2, 1, 2, 1)
  )
  
  ggraph::ggraph(example_snacc_graph, coords) +
    ggraph::geom_edge_link2(ggplot2::aes(edge_linetype = edge_type, edge_width = edge_type, edge_color = edge_type)) +
    ggraph::geom_node_circle(ggplot2::aes(r = 0.1, color = node_type, filter = node_type == "Person"), fill = "white") + 
    ggraph::geom_node_circle(ggplot2::aes(r = 0.1, color = node_type, filter = node_type == "Place"), fill = "grey")
}


style_ssnac_example <- function(plot){
  
  mpxnyc_colors <- targets::tar_read(config_list)[[1]][["content"]][["colors"]]
  
  edge_width_key    <- c("Employee" = 0.3, "Friend" = 0.3, "Neighbor" = 1.2, "Resident" = 1.5)
  edge_linetype_key <- c("Employee" = 1, "Friend" = 2, "Neighbor" = 2, "Resident" = 1)
  node_color_key    <- c("Person" = mpxnyc_colors$dark_pink, "Place" = "black")
  edge_color_key    <- c("Employee" = "#000000", "Friend" = "#000000", "Neighbor" = "#000000", "Resident" = mpxnyc_colors$mid_blue)
  
  plot +
    ggplot2::theme_void() +
    ggplot2::coord_fixed() +
    ggraph::scale_edge_width_manual("Edge type", values = edge_width_key) +
    ggraph::scale_edge_linetype_manual("Edge type", values = edge_linetype_key ) +
    ggplot2::scale_color_manual("Node type", values = node_color_key) +
    ggraph::scale_edge_color_manual("Edge type", values =edge_color_key ) +
    ggplot2::theme(
      legend.margin = ggplot2::margin(15, 15, 15, 15),
    )
  
}
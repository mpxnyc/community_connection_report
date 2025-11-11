plot_ssnac_example <- function(data){
  
  
  example_snacc_graph <- data 
  
  coords <- data.frame(
    x = c(1, 1, 2, 2.5, 2.5, 3, 3.5, 3.5, 4, 4, 2, 2, 3, 3),
    y = c(2, 1, 3, 2.5, 1.5, 3, 2.5, 1.5, 2, 1, 2, 1, 2, 1)
  )
  
  ggraph::ggraph(example_snacc_graph, coords) +
    ggraph::geom_edge_link(ggplot2::aes(edge_linetype = edge_type, width = edge_width)) +
    ggraph::geom_node_circle(ggplot2::aes(r = 0.1, color = node_color, filter = node_type == "Person"), fill = "white") + 
    ggraph::geom_node_circle(ggplot2::aes(r = 0.1, color = node_color, filter = node_type == "Place"), fill = "grey")
}
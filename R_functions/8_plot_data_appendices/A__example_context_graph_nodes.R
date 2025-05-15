example_context_graph_nodes            <- function(plot){
  plot +
    ggraph::geom_node_circle(
      ggplot2::aes(r = 0.1), 
      fill = "white", 
      color = "#F73C95"
    ) 
}

example_context_graph_base             <- function(title = ""){
  x_coords                 <- c(1, 1, 2, 2, 3, 3, 3.5, 4, 4, 4)
  y_coords                 <- c(2, 3.5, 3, 4, 2, 3, 3.5, 1, 3, 4)
  
  
  
  coords                   <- data.frame(x = x_coords, y = y_coords) 
  
  nodes                    <- data.frame(name = paste("node", 1:10, sep = "_"))
  edges                    <- data.frame(
    from = c("node_1", "node_4", "node_3", "node_5"),
    to   = c("node_2", "node_10", "node_6", "node_8")
  )
  
  example_context_graph    <- tidygraph::tbl_graph(nodes = nodes, edges = edges)
  
  ggraph::ggraph(example_context_graph, coords) +
    
    ggplot2::ylim(0,5) +
    ggplot2::xlim(0,5) +
    ggplot2::theme_void() +
    ggplot2::coord_fixed() +
    ggplot2::ggtitle(title) +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5, size = 20, color = "darkgrey"))
} 
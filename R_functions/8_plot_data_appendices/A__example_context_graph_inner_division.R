example_context_graph_inner_division   <- function(plot){
  plot   +
    
    ggplot2::geom_linerange(y = 2.5, xmin = 0.5, xmax = 4.5) +
    ggplot2::geom_linerange(x = 2.5, ymin = 0.5, ymax = 4.5) 
}

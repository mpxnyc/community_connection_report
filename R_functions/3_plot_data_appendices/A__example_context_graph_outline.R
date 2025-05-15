example_context_graph_outline          <- function(plot){
  plot +
    
    ggplot2::geom_linerange(y = 0.5, xmin = 0.5, xmax = 4.5) +
    ggplot2::geom_linerange(y = 4.5, xmin = 0.5, xmax = 4.5) +
    ggplot2::geom_linerange(x = 0.5, ymin = 0.5, ymax = 4.5) +
    ggplot2::geom_linerange(x = 4.5, ymin = 0.5, ymax = 4.5)
}
example_context_graph_inner_gates      <- function(plot){
  plot +
    ggplot2::geom_linerange(y = 1.5, xmin = 0.6, xmax = 4.4, size = 10, color = "white") +
    ggplot2::geom_linerange(y = 3.5, xmin = 0.6, xmax = 4.4, size = 10, color = "white") +
    ggplot2::geom_linerange(x = 1.5, ymin = 0.6, ymax = 4.4, size = 10, color = "white") +
    ggplot2::geom_linerange(x = 3.6, ymin = 0.6, ymax = 4.4, size = 10, color = "white")
}
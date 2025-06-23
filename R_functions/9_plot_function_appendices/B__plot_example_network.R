


plot_example_bipartite_network <- function(network, label_size = 3, edge_width = 1, edge_alpha = 0.3, edge_color = "grey", node_text_color = "white"){
  network |>
    ggraph::ggraph(layout = "kk") +
    ggraph::geom_edge_fan(ggplot2::aes( label = relation), angle_calc = 'along', label_size = label_size, color = edge_color, edge_width = edge_width, edge_alpha = edge_alpha) +
    ggraph::geom_node_point(ggplot2::aes(color = type, size = type)) +
    ggraph::geom_node_text(ggplot2::aes(label = label, size = type), color = node_text_color, show.legend = FALSE) 
}


plot_example_projection_network <- function(network, label_size = 3, edge_width = 1, edge_alpha = 0.3, edge_color = "grey", node_text_color = "white"){
  network |>
    ggraph::ggraph(layout = "kk") +
    ggraph::geom_edge_fan(ggplot2::aes(edge_width = as.character(weight)), angle_calc = 'along', color = edge_color, edge_alpha = edge_alpha) +
    ggraph::geom_node_point(ggplot2::aes(color = type, size = type)) +
    ggraph::geom_node_text(ggplot2::aes(label = label, size = type), color = node_text_color, show.legend = FALSE) 
}

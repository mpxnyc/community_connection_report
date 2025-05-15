plot_example_network      <- function(network, config_list){
  mpxnyc_colors <- config_list[[1]][["content"]][["colors"]]
  
  
  example_colors            <- c("FALSE" = mpxnyc_colors$dark_pink, "TRUE" = mpxnyc_colors$dark_blue)
  example_size_dot          <- c("FALSE" = 20, "TRUE" = 10)
  example_size_text         <- c("FALSE" = 5, "TRUE" = 10)
  example_edge_width_weight <- c("1" = 0.1, "2" = 1, "3" = 2)
  
  
  edge_var_names            <- network |> 
                                  tidygraph::activate(edges) |>
                                  data.frame() |>
                                  names() 
  
  bipartite                 <- "relation" %in% edge_var_names
    
  result                    <- network |>
                                  ggraph::ggraph(layout = "kk") +
                                  ggraph::geom_edge_fan(ggplot2::aes(edge_width = weight_label, label = relation)) +
                                  ggraph::geom_node_point(ggplot2::aes(color = type, size = type)) +
                                  ggraph::geom_node_text(ggplot2::aes(label = label, size = type), color = "white") +
                                  ggplot2::scale_color_manual(values = example_colors) +
                                  ggraph::scale_edge_width_manual(values = example_edge_width_weight) +
                                  ggplot2::scale_size_manual(values = example_size_dot) 
    

  if (bipartite){
    result                    <- network |>
      ggraph::ggraph(layout = "kk") +
      ggraph::geom_edge_fan(ggplot2::aes( label = relation), angle_calc = 'along', label_size = 3, color = "grey", edge_width = 1, edge_alpha = 0.3) +

      ggraph::geom_node_point(ggplot2::aes(color = type, size = type)) +
      ggraph::geom_node_text(ggplot2::aes(label = label, size = type), color = "white") +
      ggplot2::scale_color_manual(values = example_colors) +
      ggraph::scale_edge_width_manual(values = example_edge_width_weight) +
      ggplot2::scale_size_manual(values = example_size_dot) +
      ggplot2::coord_cartesian(xlim=c(-2,2), ylim=c(-1.1,1.2))
  } else {
    result                    <- network |>
      ggraph::ggraph(layout = "kk") +
      ggraph::geom_edge_fan(ggplot2::aes(edge_width = weight_label)) +
      ggraph::geom_node_point(ggplot2::aes(color = type, size = type)) +
      ggraph::geom_node_text(ggplot2::aes(label = label, size = type), color = "white") +
      ggplot2::scale_color_manual(values = example_colors) +
      ggraph::scale_edge_width_manual(values = example_edge_width_weight) +
      ggplot2::scale_size_manual(values = example_size_dot) +
      ggplot2::coord_cartesian(xlim=c(-1.5,1.5), ylim=c(-1.5,1.5))
  }
  
  
  
 result
  
  
  
}
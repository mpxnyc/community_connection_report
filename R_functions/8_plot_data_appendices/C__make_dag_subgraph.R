make_dag_subgraph <- function(graph_type_input = "fork"){
  
  graph_nodes_list                           <- list() 
  
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A", label = r"($A$)"        , x = 2, y = 1,   node_shape = "covariate", graph_type = "fork")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "B", label = r"($B$)"        , x = 1, y = 2,   node_shape = "covariate", graph_type = "fork")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "C", label = r"($C$)"        , x = 2, y = 3,   node_shape = "covariate", graph_type = "fork")))
  
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A", label = r"($A$)"        , x = 1, y = 1,   node_shape = "covariate", graph_type = "spoon")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "B", label = r"($B$)"        , x = 2, y = 2,   node_shape = "covariate", graph_type = "spoon")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "C", label = r"($C$)"        , x = 1, y = 3,   node_shape = "covariate", graph_type = "spoon")))
  
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A", label = r"($A$)"        , x = 1, y = 1,   node_shape = "covariate", graph_type = "chopstick")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "B", label = r"($B$)"        , x = 2, y = 2,   node_shape = "covariate", graph_type = "chopstick")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "C", label = r"($C$)"        , x = 3, y = 3,   node_shape = "covariate", graph_type = "chopstick")))
  
  
  
  graph_nodes <- graph_nodes_list |>
    dplyr::bind_rows() |>
    dplyr::mutate(node_radius = 0.2) |>
    dplyr::mutate(label = latex2exp::TeX(label, output = "character")) |>
    dplyr::mutate(node_type = node_shape) |>
    dplyr::mutate(node_type = ifelse(node_shape == "preintervention", "covariate", node_shape)) |>
    dplyr::filter(graph_type == graph_type_input)
  
  
  
  graph_edges_list <- list()
  
  graph_edges_list[["fork"]] <- data.frame(
    from                 = c("B", "B"),
    to                   = c("A", "C")
  )
  
  graph_edges_list[["spoon"]] <- data.frame(
    from                 = c("A", "C"),
    to                   = c("B", "B")
  ) 
  
  graph_edges_list[["chopstick"]] <- data.frame(
    from                 = c("A", "B"),
    to                   = c("B", "C")
  )
  
  
  
  
  graph_edges <- graph_edges_list[[graph_type_input]]
  
  
  
  tidygraph::tbl_graph(nodes = graph_nodes, edges = graph_edges)  
  
}
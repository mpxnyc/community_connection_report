make_swig <- function(graph_type){
  
  
  graph_nodes_list                           <- list() 
  
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "L1", label = r"($L_1$)"              , x = 1, y = 1,   homogenous = FALSE, node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "L2", label = r"($L_2$)"              , x = 1, y = 3,   homogenous = FALSE, node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "L3", label = r"($L_3$)"              , x = 1, y = 5,   homogenous = FALSE, node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A1", label = r"($A_1$)"              , x = 3, y = 2,   homogenous = FALSE, node_shape = "preintervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A2", label = r"($A_2$)"              , x = 3, y = 3,   homogenous = FALSE, node_shape = "preintervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "A3", label = r"($A_3$)"              , x = 3, y = 4,   homogenous = FALSE, node_shape = "preintervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "a1", label = r"($a_1$)"              , x = 3, y = 2,   homogenous = FALSE, node_shape = "intervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "a2", label = r"($a_2$)"              , x = 3, y = 3,   homogenous = FALSE, node_shape = "intervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "a3", label = r"($a_3$)"              , x = 3, y = 4,   homogenous = FALSE, node_shape = "intervention")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "LNet1", label = r"($L_{N_1}$)"       , x = 2, y = 1.5, homogenous = TRUE , node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "LNet2", label = r"($L_{N_2}$)"       , x = 2, y = 3,   homogenous = TRUE , node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "LNet3", label = r"($L_{N_3}$)"       , x = 2, y = 4.5, homogenous = TRUE , node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "ANet1", label = r"($a_{N_1}$)"       , x = 4, y = 1.5, homogenous = TRUE , node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "ANet2", label = r"($a_{N_2} $)"      , x = 4, y = 3,   homogenous = TRUE , node_shape = "covariate")))
  graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "ANet3", label = r"($a_{N_3} $)"      , x = 4, y = 4.5, homogenous = TRUE , node_shape = "covariate")))
  
  if (graph_type == "independence"){
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y1", label = r"($Y_1^{(a_1)}$)"   , x = 5, y = 1,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y2", label = r"($Y_2^{(a_2)}$)"   , x = 5, y = 3,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y3", label = r"($Y_3^{(a_3)}$)"        , x = 5, y = 5,   homogenous = FALSE, node_shape = "covariate")))
  }
  
  if (graph_type == "network_interference"){
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y1", label = r"($Y_1^{(a_1, a_2)}$)"   , x = 5, y = 1,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y2", label = r"($Y_2^{(a_1, a_2)}$)"   , x = 5, y = 3,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y3", label = r"($Y_3^{(a_3)}$)"        , x = 5, y = 5,   homogenous = FALSE, node_shape = "covariate")))
  }
  
  if (graph_type == "homogenous_interference"){
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y1", label = r"($Y_1^{(a_1, a_{N_1})}$)"   , x = 5, y = 1,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y2", label = r"($Y_2^{(a_2, a_{N_2})}$)"   , x = 5, y = 3,   homogenous = FALSE, node_shape = "covariate")))
    graph_nodes_list <- append(graph_nodes_list, list(data.frame(name = "Y3", label = r"($Y_3^{(a_3, a_{N_3})}$)"        , x = 5, y = 5,   homogenous = FALSE, node_shape = "covariate")))
  }
  
  
  graph_nodes <- graph_nodes_list |>
    dplyr::bind_rows() |>
    dplyr::mutate(node_radius = 0.2) |>
    dplyr::mutate(label = latex2exp::TeX(label, output = "character")) |>
    dplyr::mutate(node_type = node_shape) |>
    dplyr::mutate(node_type = ifelse(node_shape == "preintervention", "covariate", node_shape))
  
  
  
  graph_edges_list <- list()
  
  graph_edges_list[["independence"]] <- data.frame(
    from                 = c("L1", "L2", "L3", "L1", "L2", "L3", "a1", "a2", "a3"),
    to                   = c("A1", "A2", "A3", "Y1", "Y2", "Y3", "Y1", "Y2", "Y3")
  )
  
  graph_edges_list[["network_interference"]] <- data.frame(
    from                 = c("L1", "L2", "L1", "L2", "a1", "a2"),
    to                   = c("A2", "A1", "Y2", "Y1", "Y2", "Y1")
  ) |>
    rbind(graph_edges_list[["independence"]] )
  
  graph_edges_list[["full_interference"]] <- data.frame(
    from                 = c("L1", "L3", "L1", "L3", "a1", "a3", 
                             "L2", "L3", "L2", "L3", "a2", "a3"),
    to                   = c("A3", "A1", "Y3", "Y1", "Y3", "Y1",
                             "A3", "A2", "Y3", "Y2", "Y3", "Y2")) |>
    rbind(graph_edges_list[["network_interference"]] )
  
  graph_edges_list[["fully_connected"]] <- data.frame(
    from                 = c("L1", "a1", "Y1"),
    to                   = c("L2", "A2", "Y2")
  ) |>
    rbind(graph_edges_list[["full_interference"]] )
  
  
  
  graph_edges_list[["homogenous_interference"]] <- data.frame(
    from                 = c("L1"   , "L2"   , "a1"   , "a2"   , "LNet2", "LNet1", "LNet2", "LNet1", "ANet2", "ANet1"),
    to                   = c("LNet2", "LNet1", "ANet2", "ANet1", "A2"   , "A1"   , "Y2"   , "Y1"   , "Y2"   , "Y1"   )) |>
    rbind(graph_edges_list[["independence"]])
  
  
  
  
  graph_edges <- graph_edges_list[[graph_type]]
  
  if (graph_type != "homogenous_interference") {
    graph_nodes <- graph_nodes |>
      dplyr::filter(!homogenous)
  }
  
  
  tidygraph::tbl_graph(nodes = graph_nodes, edges = graph_edges)  
  
}
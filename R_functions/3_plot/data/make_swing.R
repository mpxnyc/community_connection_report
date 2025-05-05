example_swing_structural <- function(){
  
  structural_nodes <- data.frame(
    name  = c("T", "t", "A", "Y"),
    label = c(r"($T$)", r"($t$)", r"($M)", r"($V$)") |> latex2exp::TeX(output = "character", bold = TRUE),
    x = c(1, 1, 2, 3),
    y = c(1, 1, 1, 1),
    node_type = c("Community", "Community", "Individual", "Individual"),
    node_shape = c("preintervention", "intervention" ,"covariate", "covariate")
  ) 
  
  structural_edges <- data.frame(
    from = c("t", "A"),
    to   = c("A", "Y")
  )
  
  tidygraph::tbl_graph(nodes = structural_nodes, edges = structural_edges)
}

example_swing_relational <- function(){
  
  network_nodes <- data.frame(
    name = c("A", "B", "C", "1", "2", "3", "4", "5"),
    label = c("A", "B", "C", "1", "2", "3", "4", "5"),
    y  = c( 1, 1, 1, 2, 2, 2, 2, 2),
    x =  c(1, 2, 3, 1, 2, 3, 4, 5),
    node_type = c(rep("Community", 3), rep("Individual", 5)),
    node_shape = "covariate"
  )
  
  network_edges <- data.frame(
    from = c("C", "C", "C", "C", "A", "A", "B", "B"),
    to =   c("2", "3", "4", "5", "1", "2", "1", "3")
  )
  
  tidygraph::tbl_graph(nodes = network_nodes, edges = network_edges)
}

program_swing <- function(){
  list_nodes <- list()
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M0", label = r"($M_{0}$)", x = -1, y = 6, node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V0", label = r"($V_{0}$)"      , x = 1 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R1", label = r"($R_{1}$)"      , x = 2 , y = 2 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T1", label = r"($T_{1}$)"      , x = 3 , y = 4 , node_type = "Community", node_shape = "preintervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "t1", label = r"($t_{1}$)"      , x = 3 , y = 4 , node_type = "intervention", node_shape = "intervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M1", label = r"($M_{1}^{(t_1)}$)"      , x = 4 , y = 6 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V1", label = r"($V_{1}^{(t_1)}$)"      , x = 5 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R2", label = r"($R_{2}^{(t_1)}$)" , x = 6 , y = 2 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T2", label = r"($T_{2}$)"      , x = 7 , y = 4 , node_type = "Community", node_shape = "preintervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "t2", label = r"($t_{2}$)"      , x = 7 , y = 4 , node_type = "intervention", node_shape = "intervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M2", label = r"($M_{2}^{(t_1, t_2)}$)"      , x = 8 , y = 6 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V2", label = r"($V_{2}^{(t_1, t_2)}$)"      , x = 9 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R3", label = r"($R_{3}^{(t_1, t_2)}$)" , x = 10 , y = 2, node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T3", label = r"($T_{3}$)"      , x = 11 , y = 4, node_type = "Community", node_shape = "preintervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "t3", label = r"($t_{3}$)"      , x = 11 , y = 4, node_type = "intervention", node_shape = "intervention")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M3", label = r"($M_{3}^{(t_1, t_2, t_3)}$)"      , x = 12 , y = 6, node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V3", label = r"($V_{3}^{(t_1, t_2, t_3)}$)"      , x = 13 , y = 8, node_type = "Individual", node_shape = "covariate")
  
  list_edges <- list()
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M0", to = "M1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "R1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "M1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R1", to = "T1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "t1", to = "M1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M1", to = "V1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R2", to = "T2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "t2", to = "M2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M2", to = "V2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R3", to = "T3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "t3", to = "M3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M3", to = "V3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "R2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "R3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M1", to = "M2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M2", to = "M3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "M2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "M3")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "V1")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "V2")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "V3")
  
  
  structural_nodes <- list_nodes |> dplyr::bind_rows() |> dplyr::mutate(label = latex2exp::TeX(label, output = "character", bold = TRUE))
  structural_edges <- list_edges |> dplyr::bind_rows()
  
  tidygraph::tbl_graph(nodes = structural_nodes, edges = structural_edges)
  
}

hypothetical_intervention_swing <- function(){
  list_nodes <- list()
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M0", label = r"($M_{0}$)", x = -1, y = 6, node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V0", label = r"($V_{0}$)"      , x = 1 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R1", label = r"($R_{1}^{(h)}$)"      , x = 2 , y = 2 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T1", label = r"($T_{1}^{(h)}$)"      , x = 3 , y = 4 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M1", label = r"($M_{1}^{(h)}$)"      , x = 4 , y = 6 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V1", label = r"($V_{1}^{(h)}$)"      , x = 5 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R2", label = r"($R_{2}^{(h)}$)" , x = 6 , y = 2 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T2", label = r"($T_{2}^{(h)}$)"      , x = 7 , y = 4 , node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M2", label = r"($M_{2}^{(h)}$)"      , x = 8 , y = 6 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V2", label = r"($V_{2}^{(h)}$)"      , x = 9 , y = 8 , node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "R3", label = r"($R_{3}^{(h)}$)" , x = 10 , y = 2, node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "T3", label = r"($T_{3}^{(h)}$)"      , x = 11 , y = 4, node_type = "Community", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "M3", label = r"($M_{3}^{(h)}$)"      , x = 12 , y = 6, node_type = "Individual", node_shape = "covariate")
  list_nodes[[length(list_nodes) + 1]] <- data.frame(name = "V3", label = r"($V_{3}^{(h)}$)"      , x = 13 , y = 8, node_type = "Individual", node_shape = "covariate")
  
  list_edges <- list()
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M0", to = "M1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "R1", edge_label = r"($h$)")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "M1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R1", to = "T1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "T1", to = "M1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M1", to = "V1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R2", to = "T2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "T2", to = "M2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M2", to = "V2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "R3", to = "T3", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "T3", to = "M3", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M3", to = "V3", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "R2", edge_label = r"($h$)")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "R3", edge_label = r"($h$)")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M1", to = "M2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "M2", to = "M3", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "M2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "M3", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V0", to = "V1", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V1", to = "V2", edge_label = r"()")
  list_edges[[length(list_edges) + 1]] <- data.frame(from = "V2", to = "V3", edge_label = r"()")
  
  
  structural_nodes <- list_nodes |> dplyr::bind_rows() |> dplyr::mutate(label = latex2exp::TeX(label, output = "character", bold = TRUE))
  structural_edges <- list_edges |> dplyr::bind_rows() 
  
  
  tidygraph::tbl_graph(nodes = structural_nodes, edges = structural_edges)
}



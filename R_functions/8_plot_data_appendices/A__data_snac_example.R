data_ssnac_example <- function() {
  

  edge_width_key    <- c("Employee" = 0.3, "Friend" = 0.3, "Neighbor" = 1.2, "Resident" = 1.5)
  edge_linetype_key <- c("Employee" = 1, "Friend" = 2, "Neighbor" = 2, "Resident" = 1)
  node_color_key    <- c("Person" = mpxnyc_colors$dark_pink, "Place" = "black")
  edge_color_key    <- c("Employee" = "#000000", "Friend" = "#000000", "Neighbor" = "#000000", "Resident" = mpxnyc_colors$mid_blue)
  
  snacc_nodes <- data.frame(
                            name = paste("node", 1:14, sep = "_"), 
                            node_type = c(rep("Person", 10), rep("Place", 4))
                            ) |>
                        dplyr::mutate(
                          node_color = node_color_key[node_type]
                          ) 
    
  
  
  snacc_edges <- data.frame(from = c("node_1", "node_3", "node_4", 
                                     "node_5", "node_11", "node_11", "node_12", "node_13", 
                                     "node_11", "node_11", "node_11", "node_12", "node_13", 
                                     "node_13", "node_13", "node_13", "node_14", "node_14"), 
                            to = c("node_2", "node_6", "node_7", "node_8", "node_12", 
                                   "node_13", "node_14", "node_14", "node_1", "node_3", 
                                   "node_4", "node_2", "node_6", "node_7", "node_8", 
                                   "node_9", "node_5", "node_10"), 
                            edge_type = c(rep("Friend", 4), rep("Neighbor", 4), rep("Resident", 10))) |>
    dplyr::mutate(edge_line_type = edge_linetype_key[edge_type],
                  edge_line_width = edge_width_key[edge_type])
  
  tidygraph::tbl_graph(nodes = snacc_nodes, edges = snacc_edges)  
}
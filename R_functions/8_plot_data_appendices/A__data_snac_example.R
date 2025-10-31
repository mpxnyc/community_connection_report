data_ssnac_example <- function() {
  snacc_nodes <- data.frame(name = paste("node", 1:14, sep = "_"), 
                            node_type = c(rep("Person", 10), rep("Place", 4)))
  snacc_edges <- data.frame(from = c("node_1", "node_3", "node_4", 
                                     "node_5", "node_11", "node_11", "node_12", "node_13", 
                                     "node_11", "node_11", "node_11", "node_12", "node_13", 
                                     "node_13", "node_13", "node_13", "node_14", "node_14"), 
                            to = c("node_2", "node_6", "node_7", "node_8", "node_12", 
                                   "node_13", "node_14", "node_14", "node_1", "node_3", 
                                   "node_4", "node_2", "node_6", "node_7", "node_8", 
                                   "node_9", "node_5", "node_10"), edge_type = c(rep("Friend", 
                                                                                     4), rep("Neighbor", 4), rep("Resident", 10)))
  tidygraph::tbl_graph(nodes = snacc_nodes, edges = snacc_edges)
}
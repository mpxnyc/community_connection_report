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
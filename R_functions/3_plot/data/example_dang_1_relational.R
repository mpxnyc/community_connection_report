example_dang_1_relational <- function(){
  network_nodes <- data.frame(
    name  = c("1", "2", "3"),
    label = c("1", "2", "3"),
    x  = c( 1, 1, 2),
    y = c(1, 2, 1),
    node_type = c("Person", "Person", "Person"),
    node_shape = "covariate"
  )
  
  network_edges <- data.frame(
    from = c("1"),
    to   = c("2")
  )
  
  tidygraph::tbl_graph(nodes = network_nodes, edges = network_edges)
}

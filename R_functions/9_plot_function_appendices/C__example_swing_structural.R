example_swing_structural <- function(){
  
  structural_nodes <- data.frame(
    name  = c("T", "t", "A", "Y"),
    label = c(r"($T$)", r"($t$)", r"($M^{(t)})", r"($V^{(t)}$)") |> latex2exp::TeX(output = "character", bold = TRUE),
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
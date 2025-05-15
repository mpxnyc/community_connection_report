example_dang_2_structural <- function(){
  
  
  structural_nodes <- data.frame(
    name  = c("C", "A", "Y"),
    label = c(r"($T_{3 \times 1}$)", r"($M_{5 \times 1})", r"($V_{5 \times 1}$)") |> latex2exp::TeX(output = "character", bold = TRUE),
    x = c(1, 2, 3),
    y = c(1, 1, 1),
    node_type = c("Community", "Individual", "Individual"),
    node_shape = "covariate"
  ) 
  
  structural_edges <- data.frame(
    from = c("C", "A"),
    to   = c("A", "Y")
  )
  
  
  tidygraph::tbl_graph(nodes = structural_nodes, edges = structural_edges)
  
}
example_dang_1_structural <- function(){
  
  structural_nodes <- data.frame(
    name  = c("L", "A", "Y"),
    label = c(r"($L_{3 \times 1}$)", r"($A_{3 \times 1})", r"($Y_{3 \times 1}$)") |> latex2exp::TeX(output = "character", bold = TRUE),
    x = c(1, 2, 3),
    y = c(2, 1, 1),
    node_type = "person",
    node_shape = "covariate"
  ) 
  
  structural_edges <- data.frame(
    from = c("L", "A", "L"),
    to   = c("A", "Y", "Y")
  )
  
  
  
  tidygraph::tbl_graph(nodes = structural_nodes, edges = structural_edges)
  
}
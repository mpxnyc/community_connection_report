make_table_movement_coattendance  <- function(){
  
  targets::tar_read(bipartite_graph) %>%
    igraph::bipartite_projection(which = "false") %>%
    tidygraph::as_tbl_graph() %>%
    activate(edges) %>%
    mutate(from_name = .N()$name[from], to_name = .N()$name[to]) %>%
    data.frame() %>%
    transmute(from = from_name, to = to_name, weight = weight) %>%
    mutate(
      new_from =  ifelse(from > to, from, to), 
      new_to = ifelse(from > to, to, from)
    ) %>%
    transmute(from = new_from, to = new_to, weight = weight) %>%
    group_by(from, to) %>%
    summarize(weight = sum(weight))
  
  
}
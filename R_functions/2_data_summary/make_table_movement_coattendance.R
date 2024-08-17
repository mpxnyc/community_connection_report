make_table_movement_coattendance  <- function(){
  
  targets::tar_read(data_bipartite_graph_collected) %>%
          igraph::bipartite_projection(which = "false") %>%
          tidygraph::as_tbl_graph() %>%
          tidygraph::activate(edges) %>%
          tidygraph::mutate(from_name = .N()$name[from], to_name = .N()$name[to]) %>%
          data.frame() %>%
          dplyr::transmute(from = from_name, to = to_name, weight = weight) %>%
          dplyr::mutate(
                        new_from =  ifelse(from > to, from, to), 
                        new_to = ifelse(from > to, to, from)
          ) %>%
          dplyr::transmute(from = new_from, to = new_to, weight = weight) %>%
          dplyr::group_by(from, to) %>%
          dplyr::summarize(weight = sum(weight))
  
  
}
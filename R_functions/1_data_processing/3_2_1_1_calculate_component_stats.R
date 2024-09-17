calculate_component_stats <- function(bipartite_graph) {
  
  working_graph       <- bipartite_graph %>%
                            igraph::bipartite_projection(which = "true") %>%
                            tidygraph::as_tbl_graph() 
  
  
  component_membership <- igraph::components(working_graph)$membership
  
  working_graph %>%
          tidygraph::mutate(connected_component = component_membership[name]) %>%
          tidygraph::select(name, connected_component) %>%
          data.frame() %>%
          dplyr::group_by(connected_component) %>%
          dplyr::summarize(count = n()) %>%
          dplyr::arrange(-count) %>%
          dplyr::group_by() %>%
          dplyr::summarize(
                            n_lcc = max(count),
                            n_remainder = sum(count) - n_lcc 
          )
          
        
  
}
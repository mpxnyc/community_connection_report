plot_network_viz        <- function(data){
  
  graph_object <- targets::tar_read(data_bipartite_graph_collected) %>%
    igraph::bipartite_projection(which = "false") %>%
    tidygraph::as_tbl_graph() %>%
    dplyr::rename(level = name) %>% 
    dplyr::left_join(data) %>%
    dplyr::select(level, group) %>%
    dplyr::mutate(deg = igraph::degree(.)) %>%
    #dplyr::filter(deg > 0) %>%
    dplyr::filter(!is.na(group)) %>%
    tidygraph::activate(edges) %>%
    dplyr::mutate(group_from = .N()$group[from], group_to = .N()$group[to]) %>%
    dplyr::mutate(outer_edges = group_from == "Group C" | group_to == "Group C") %>%
    tidygraph::to_directed() 
  
  from  <- graph_object %>% pull(from)
  to    <- graph_object %>% pull(to)
  weight <- graph_object %>% pull(weight)
  
  ggraph(graph_object) +
    geom_edge_link( aes(linewidth = weight), alpha = 0.3, , linewidth = 0.1) +
    geom_node_point(aes(color = group, filter = group %in% c("Group C") ), size = 2) +
    geom_edge_link( aes(linewidth = weight, filter = !outer_edges), alpha = 0.1) +

    geom_node_label(aes(label = level , fill = group, size = deg, filter = group %in% c("Group A", "Group B")),  color = "white") +
    theme_void() +
    scale_color_manual(values = c("Group A" = dark_pink, "Group B" = dark_blue, "Group C" = "grey")) +
    scale_fill_manual(values = c("Group A" = dark_pink, "Group B" = dark_blue, "Group C" = "grey")) +
    scale_linewidth_continuous() +
    theme(
      legend.position = "none",
      plot.margin = margin(0,0,0,0, "cm"),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5),
      plot.caption = element_text(hjust = 0)
    ) 
  
}

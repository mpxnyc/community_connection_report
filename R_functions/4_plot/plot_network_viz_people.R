plot_network_viz_people        <- function(data, which = "true"){
  
  graph_object <- targets::tar_read(data_bipartite_graph_collected) %>%
    igraph::bipartite_projection(which = which) %>%
    tidygraph::as_tbl_graph() %>%
    select(name) %>%
    dplyr::left_join(data) %>%
    tidygraph::activate(edges) %>%
    mutate(from_group = .N()$group[from], to_group = .N()$group[to]) %>%
    tidygraph::to_directed() %>%
    activate(nodes) %>%
    #mutate(borough = mpxnyc::convert_spatial_unit_ny(input_community_district = name, convert_to = "borough")) %>%
    mutate(group = ifelse(is.na(group), "Group C", group)) %>%
    mutate(deg = degree(.)) 
  

  
  ggraph(graph_object, layout = 'igraph', algorithm = 'kk') +
    geom_edge_link(aes( filter = from_group == "Group C" | to_group == "Group C"), edge_width = 0.1, alpha = 0.6, show.legend = FALSE) +
    geom_edge_link( aes(linewidth = weight, filter = from_group != "Group C" & to_group != "Group C"), alpha = 0.4, color = light_orange, show.legend = FALSE) +
    geom_node_point(aes(label = name , color = borough,  filter = group == "Group C"), size = 1) +
    geom_node_label(aes(label = name , fill = borough, size = mean_count, filter = group != "Group C"), color = "white") +
    theme_void() +
    scale_linewidth_continuous() +
    theme(
      legend.position = "none",
      plot.margin = margin(0,0,0,0, "cm"),
      plot.title = element_text(hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5),
      plot.caption = element_text(hjust = 0)
    ) 
  
}

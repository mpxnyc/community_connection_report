make_reach_diagram_data <- function(
                                    focal_node = "Person 6", 
                                    intermediate_nodes = c(),
                                    alter_nodes = c("Community d", "Community e")
) {
  make_example_network_data("bipartite") |>
    tidygraph::mutate(type_color = ifelse(name == focal_node, "Focal node", ifelse(name %in% alter_nodes, "Reached nodes", ifelse(name %in% intermediate_nodes, "Intermediate nodes", NA)))) |>
  tidygraph::activate(edges) |>
  tidygraph::mutate(type_color = NA) 
}

find_top_neighborhoods <- function(bipartite_graph_sim_ranked, intervention_priority_input, intervention_setting_input, stratum_input){
  bipartite_graph_sim_ranked %>%
    tidygraph::activate(edges) %>%
    tidygraph::filter(intervention_setting %in% intervention_setting_input) %>%
    tidygraph::activate(nodes) %>%
    tidygraph::filter(is.na(intervention_ranking)) %>%
    tidygraph::filter(stratum == stratum_input | !type) %>%
    igraph::simplify() %>%
    tidygraph::as_tbl_graph() %>%
    tidygraph::mutate(contact = igraph::degree(.)) %>%
    igraph::bipartite.projection(which = "false") %>%
    tidygraph::as_tbl_graph() %>%
    tidygraph::mutate(movement = igraph::strength(.)) %>%
    data.frame() %>%
    dplyr::mutate(count = .[,intervention_priority_input]) %>%
    arrange(-count, rep) %>%
    arrange(rep) %>%
    group_by(rep) %>%
    arrange(-count) %>%
    summarize(name = first(name)) %>%
    pull(name)
}


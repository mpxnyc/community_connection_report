calculate_component_stats <- function(bipartite_graph) {
  
  working_graph       <- bipartite_graph %>%
    igraph::bipartite_projection(which = "true") %>%
    tidygraph::as_tbl_graph() 
  
  
  component_membership <- igraph::components(working_graph)$membership
  
  working_graph %>%
    mutate(connected_component = component_membership[name]) %>%
    select(name, connected_component, rep) %>%
    data.frame() %>%
    group_by(rep, connected_component) %>%
    summarize(count = n()) %>%
    arrange(rep, -count) %>%
    group_by(rep) %>%
    summarize(
      n_lcc = max(count),
      n_singleton = sum(count == 1),
      n_total_count = sum(count),
      n_remainder = n_total_count - n_lcc - n_singleton,
      prop_lcc = n_lcc / n_total_count,
      prop_singleton = n_singleton / n_total_count,
      prop_remainder = n_remainder / n_total_count
    ) %>%
    ungroup() %>%
    summarize(
      mean_n_lcc              = mean(n_lcc),
      mean_n_singleton        = mean(n_singleton),
      mean_n_total_count      = mean(n_total_count),
      mean_n_remainder        = mean(n_remainder),
      mean_prop_lcc           = mean(prop_lcc),
      mean_prop_singleton     = mean(prop_singleton),
      mean_prop_remainder     = mean(prop_remainder),
      ci_lb_n_lcc              = quantile(n_lcc, 0.025),
      ci_lb_n_singleton        = quantile(n_singleton, 0.025),
      ci_lb_n_total_count      = quantile(n_total_count, 0.025),
      ci_lb_n_remainder        = quantile(n_remainder, 0.025),
      ci_lb_prop_lcc           = quantile(prop_lcc, 0.025),
      ci_lb_prop_singleton     = quantile(prop_singleton, 0.025),
      ci_lb_prop_remainder     = quantile(prop_remainder, 0.025),
      ci_ub_n_lcc              = quantile(n_lcc, 0.975),
      ci_ub_n_singleton        = quantile(n_singleton, 0.975),
      ci_ub_n_total_count      = quantile(n_total_count, 0.975),
      ci_ub_n_remainder        = quantile(n_remainder, 0.975),
      ci_ub_prop_lcc           = quantile(prop_lcc, 0.975),
      ci_ub_prop_singleton     = quantile(prop_singleton, 0.975),
      ci_ub_prop_remainder     = quantile(prop_remainder, 0.975)
    )
  
  
}
make_table_mixing       <- function(variable){
  variable <- enquo(variable)
  
  variable_name <- quo_name(variable)
  
  
  data <- targets::tar_read(data_bipartite_graph_collected) %>%
    filter(!(demo_group %in% c("missing", "other")) | !type) %>%
    igraph::bipartite.projection(which = "true") %>%
    as_tbl_graph(directed = FALSE) %>%
    mutate(connection_var = {{variable}}) %>%
    mutate(connection_var = factor(connection_var, get_variable_labels(variable_name)[["variable_levels"]], get_variable_labels(variable_name)[["variable_labels"]])) %>%
    activate(edges) %>%
    mutate(
      from_level = .N()$connection_var[from], 
      to_level = .N()$connection_var[to]) %>%
    data.frame() 
  
  conditional <- data %>%
    group_by(from_level, to_level) %>%
    summarize(weight = sum(weight)) %>%
    group_by(from_level) %>%
    mutate(conditional = weight / sum(weight)) %>%
    select(-weight)
  
  marginal <- data %>%
    group_by(to_level) %>%
    summarize(weight = sum(weight)) %>%
    mutate(marginal = weight / sum(weight)) %>%
    select(-weight)
  
  conditional %>%
    left_join(marginal, by = c("to_level")) %>%
    mutate(bias = conditional / marginal ) %>%
    ungroup()
}
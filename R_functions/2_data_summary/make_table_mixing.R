

specific_degree_single <- function(graph, variable, level){
  variable <- enquo(variable)

  variable_name <- dplyr::quo_name(variable)

  truth_vec <- graph %>% 
                mutate(truth = {{variable}} == level) %>%
                pull(truth) %>%
                as.numeric()
  
  names <- graph %>%
              pull(name)
  
  rep <- graph %>%
    pull(rep)
  
  degree <- graph %>%
    mutate(degree = degree(.)) %>%
    pull(degree)
  
  adj_mat <- graph %>%
                as_adj() 
  
  specific_degree <- adj_mat %*% truth_vec
  
  specific_degree <- as.numeric(specific_degree)
  
  data.frame(
    name = names,
    var = variable_name,
    level = level,
    degree = degree,
    specific_degree = specific_degree,
    rep = rep
    ) %>%
    tibble()
  
}

specific_degree <- function(graph, variable){
  
  levels_vec <- graph %>%
                  filter(!is.na({{variable}})) %>%
                  pull({{variable}}) %>%
                  unique()
  
  levels_vec %>%
    purrr::map(
              function(level) specific_degree_single(graph, {{variable}}, level)
              ) %>%
    bind_rows()
}
  

make_table_mixing_2       <- function(variable){
  
  targets::tar_read(data_bipartite_graph_simulated) %>%
    igraph::bipartite.projection(which = "true") %>%
    as_tbl_graph(directed = FALSE) %>%
    specific_degree({{variable}}) %>%
    mutate(bias = specific_degree / degree) %>%
    group_by(rep, level) %>%
    summarize(bias = mean(bias, na.rm = TRUE), bias_old = sum(specific_degree)/sum(degree)) %>%
    group_by(level) %>%
    summarize(
      mean_bias = mean(bias), 
      mean_bias_old = mean(bias_old)
    )
 
  

}


make_table_mixing       <- function(variable){

  data_simulated <- targets::tar_read(data_bipartite_graph_simulated) %>%
                        helper_calculate_bias({{variable}}) 
    
  
  data_collected <- targets::tar_read(data_bipartite_graph_collected) %>%
                        helper_calculate_bias({{variable}}) %>%
                        transmute(from_level, to_level, bias = mean_bias)
  
  data_collected %>%
    left_join(data_simulated)

}



helper_calculate_bias <- function(data_input, variable){
  
  variable <- enquo(variable)
  
  variable_name <- quo_name(variable)
  
  
  data <- data_input %>%
    filter(!(demo_group %in% c("missing", "other")) | !type) %>%
    igraph::bipartite.projection(which = "true") %>%
    as_tbl_graph(directed = FALSE) %>%
    mutate(connection_var = {{variable}}) %>%
    #mutate(connection_var = age) %>%
    activate(edges) %>%
    mutate(
      rep = .N()$rep[from],
      from_level = .N()$connection_var[from], 
      to_level = .N()$connection_var[to]
    ) %>%
    data.frame() 
  
  conditional <- data %>%
    group_by(rep, from_level, to_level) %>%
    summarize(weight = sum(weight)) %>%
    group_by(rep, from_level) %>%
    mutate(conditional = weight / sum(weight)) %>%
    select(-weight)
  
  marginal <- data %>%
    group_by(rep, to_level) %>%
    summarize(weight = sum(weight)) %>%
    mutate(marginal = weight / sum(weight)) %>%
    select(-weight)
  
  conditional %>%
    left_join(marginal, by = c("to_level", "rep")) %>%
    mutate(bias = conditional / marginal ) %>%
    mutate(log_bias = log(bias)) %>%
    group_by(from_level, to_level) %>%
    summarize(mean_bias = mean(log_bias), ci_lb_bias = quantile(log_bias, 0.025), cl_ub_bias =  quantile(log_bias, 0.975)) %>%
    transmute(from_level, to_level, mean_bias = exp(mean_bias), ci_lb_bias = exp(ci_lb_bias), cl_ub_bias = exp(cl_ub_bias)) %>%
    ungroup() %>%
    drop_na() 
}

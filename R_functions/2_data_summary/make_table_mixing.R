

specific_degree_single <- function(graph, variable, level){
  variable <- rlang::enquo(variable)

  variable_name <- dplyr::quo_name(variable)

  truth_vec <- graph |> 
                dplyr::mutate(truth = {{variable}} == level) |>
                dplyr::pull(truth) |>
                as.numeric()
  
  names <- graph |>
              dplyr::pull(name)
  
  rep <- graph |>
    dplyr::pull(rep)
  
  degree <- graph |>
    {function(x) dplyr::mutate(x, degree = igraph::degree(x))}() |>
    dplyr::pull(degree)
  
  adj_mat <- graph |>
                igraph::as_adj() 
  
  specific_degree <- adj_mat %*% truth_vec
  
  specific_degree <- as.numeric(specific_degree)
  
  data.frame(
    name = names,
    var = variable_name,
    alter_level = level,
    degree = degree,
    specific_degree = specific_degree,
    rep = rep
    ) |>
    dplyr::tibble()
  
}

specific_degree <- function(graph, variable){
  
  levels_vec <- graph |>
                  dplyr::filter(!is.na({{variable}})) |>
                  dplyr::pull({{variable}}) |>
                  unique()
  
  levels_vec |>
    purrr::map(
              function(level) specific_degree_single(graph, {{variable}}, level)
              ) |>
    dplyr::bind_rows()
}
  

make_table_mixing_2       <- function(variable){
  

  working_graph                <- targets::tar_read(data_bipartite_graph_simulated) |>
                                      igraph::bipartite.projection(which = "true") |>
                                      tidygraph::as_tbl_graph(directed = FALSE) 
  

  specific_degree_data         <-  working_graph |>
                                      dplyr::mutate(ego_level = {{variable}}) |>
                                      specific_degree({{variable}}) |>
    dplyr::mutate(preference = specific_degree / degree) |>
                                      data.frame()
 
 preference                    <- working_graph |>
                                     data.frame() |>
   dplyr::left_join(specific_degree_data, by = c("name", "rep")) |>
   dplyr::mutate(ego_level = {{variable}}) |>
                                                          dplyr::group_by(rep, ego_level, alter_level) |>
                                                          dplyr::summarize(preference = mean(preference, na.rm = TRUE)) |>
                                                          dplyr::ungroup()
                                   
 prevalence                    <- working_graph |>
                                    data.frame() |>
                                    dplyr::mutate(level = {{variable}}) |>
                   dplyr::group_by(rep, level) |>
                   dplyr::summarize(count = dplyr::n()) |>
                   dplyr::ungroup() |>
   dplyr::group_by(rep) |>
   dplyr::mutate(prevalence = count / sum(count)) |>
   dplyr::ungroup()
 
 
 preference |>
   dplyr::left_join(prevalence, by = c("rep", "alter_level" = "level")) |>
   dplyr::mutate(selection_coef = preference / prevalence ) |>
   dplyr::select(rep, ego_level, alter_level, selection_coef) |>
   dplyr::group_by(ego_level, alter_level) |>
   dplyr::summarize(
              mean_selection_coef = mean(selection_coef), 
              ci_lb_selection_coef = quantile(selection_coef, 0.025, na.rm = TRUE),
              ci_ub_selection_coef  = quantile(selection_coef, 0.975, na.rm = TRUE)
              ) |>
   dplyr::ungroup() |>
 dplyr::mutate(
   from_level = ego_level, 
   to_level = alter_level, 
   mean_bias = mean_selection_coef ,
   ci_lb_bias = ci_lb_selection_coef,
   cl_ub_bias = ci_ub_selection_coef
 ) |>
   tidyr::drop_na() 

}


make_table_mixing       <- function(variable){

  data_simulated <- targets::tar_read(data_bipartite_graph_simulated) |>
                        helper_calculate_bias({{variable}}) 
    
  
  data_collected <- targets::tar_read(data_bipartite_graph_collected) |>
                        helper_calculate_bias({{variable}}) |>
                        transmute(from_level, to_level, bias = mean_bias)
  
  data_collected |>
    left_join(data_simulated)

}



helper_calculate_bias <- function(data_input, variable){
  
  variable <- enquo(variable)
  
  variable_name <- quo_name(variable)
  
  
  data <- data_input |>
    dplyr::filter(!(demo_group %in% c("missing", "other")) | !type) |>
    igraph::bipartite.projection(which = "true") |>
    tidygraph::as_tbl_graph(directed = FALSE) |>
    dplyr::mutate(connection_var = {{variable}}) |>
    tidygraph::activate(edges) |>
    dplyr::mutate(
      rep = tidygraph::.N()$rep[from],
      from_level = tidygraph::.N()$connection_var[from], 
      to_level = tidygraph::.N()$connection_var[to]
    ) |>
    data.frame() 
  
  conditional <- data |>
    dplyr::group_by(rep, from_level, to_level) |>
    dplyr::summarize(weight = sum(weight)) |>
    dplyr::group_by(rep, from_level) |>
    dplyr::mutate(conditional = weight / sum(weight)) |>
    dplyr::select(-weight)
  
  marginal <- data |>
    dplyr::group_by(rep, to_level) |>
    dplyr::summarize(weight = sum(weight)) |>
    dplyr::mutate(marginal = weight / sum(weight)) |>
    dplyr::select(-weight)
  
  conditional |>
    dplyr::left_join(marginal, by = c("to_level", "rep")) |>
    dplyr::mutate(bias = conditional / marginal ) |>
    dplyr::mutate(log_bias = log(bias)) |>
    dplyr::group_by(from_level, to_level) |>
    dplyr::summarize(mean_bias = mean(log_bias), ci_lb_bias = quantile(log_bias, 0.025), cl_ub_bias =  quantile(log_bias, 0.975)) |>
    dplyr::transmute(from_level, to_level, mean_bias = exp(mean_bias), ci_lb_bias = exp(ci_lb_bias), cl_ub_bias = exp(cl_ub_bias)) |>
    dplyr::ungroup() |>
    tidyr::drop_na() 
}

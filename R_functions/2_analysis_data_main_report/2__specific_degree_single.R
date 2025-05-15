specific_degree_single    <- function(graph, variable, level){
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

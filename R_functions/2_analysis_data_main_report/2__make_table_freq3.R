make_table_freq3                <- function(
                                            variable = overall, 
                                            stratum_variable_a = overall, 
                                            stratum_variable_b = overall, 
                                            person_analysis = TRUE,
                                            data_bipartite_graph_collected = targets::tar_read(data_bipartite_graph_collected),
                                            data_bipartite_graph_simulated = targets::tar_read(data_bipartite_graph_simulated)
                                            ){
  variable                           <- rlang::enquo(variable)
  stratum_variable_a                 <- rlang::enquo(stratum_variable_a)
  stratum_variable_b                 <- rlang::enquo(stratum_variable_b)
  variable_name                      <- rlang::quo_name(variable)
  stratum_variable_a_name            <- rlang::quo_name(stratum_variable_a)
  stratum_variable_b_name            <- rlang::quo_name(stratum_variable_b)
  
  
  
  if (person_analysis){
    original_data_raw    <- data_bipartite_graph_collected  |>
      tidygraph::activate(nodes) |>
      tidygraph::filter(type == TRUE) 
    
    simulated_data_raw   <- data_bipartite_graph_simulated  |>
      tidygraph::activate(nodes) |>
      tidygraph::filter(type == TRUE) 
  } else {
    original_data_raw  <- data_bipartite_graph_collected |>
      tidygraph::activate(edges)  |> 
      tidygraph::filter(placeType != "home")
    
    simulated_data_raw <- data_bipartite_graph_simulated |>
      tidygraph::activate(edges) |> 
      tidygraph::filter(placeType != "home")
  }
  
  
  original_data                      <- original_data_raw |>
    data.frame() |>
    dplyr::mutate(overall = "overall") |>
    dplyr::mutate(
      level           = {{variable}},
      stratum_a       = {{stratum_variable_a}},
      stratum_b       = {{stratum_variable_b}}
    ) |>
    dplyr::filter(!is.na(level)) |>
    dplyr::mutate(
      level = as.character(level),
      stratum_a = as.character(stratum_a),
      stratum_b = as.character(stratum_b)
    ) |>
    dplyr::group_by(level, stratum_a, stratum_b) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::ungroup() |>
    dplyr::group_by(stratum_a, stratum_b) |>
    dplyr::mutate(proportion = count / sum(count)) 
  
  simulated_data                    <-   simulated_data_raw |>
    data.frame() |>
    dplyr::mutate(overall = "overall") |>
    data.frame() |>
    dplyr::mutate(
      level           = {{variable}},
      stratum_a       = {{stratum_variable_a}},
      stratum_b       = {{stratum_variable_b}}
    ) |>
    dplyr::mutate(
      level = as.character(level),
      stratum_a = as.character(stratum_a),
      stratum_b = as.character(stratum_b)
    ) |>
    dplyr::group_by(rep, level, stratum_a, stratum_b) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::ungroup() |>
    dplyr::group_by(rep, stratum_a, stratum_b) |>
    dplyr::mutate(proportion = count / sum(count)) |>
    dplyr::ungroup() |>
    dplyr::group_by(stratum_a, stratum_b, level) |>
    dplyr::summarize(
      count_mean = mean(count), 
      count_ci_lb = quantile(count, 0.025),
      count_ci_ub = quantile(count, 0.975),
      proportion_mean = mean(proportion),
      proportion_ci_lb = quantile(proportion, 0.025),
      proportion_ci_ub = quantile(proportion, 0.975)
    )
  
  
  original_data |>
    dplyr::left_join(simulated_data, by = c("level", "stratum_a", "stratum_b")) |>
    dplyr::arrange(stratum_a, stratum_b, level) |>
    dplyr::mutate(
      variable = variable_name,
      strata_a = stratum_variable_a_name,
      strata_b = stratum_variable_b_name) |>
    dplyr::ungroup() |>
    {function(x) dplyr::select(x, variable, strata_a, strata_b, names(x))}() |>
    dplyr::filter(!is.na(level))
  
}



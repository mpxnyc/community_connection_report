make_table_freq3                <- function(variable = overall, stratum_variable_a = overall, stratum_variable_b = overall, person_analysis = TRUE){
  variable                           <- enquo(variable)
  stratum_variable_a                 <- enquo(stratum_variable_a)
  stratum_variable_b                 <- enquo(stratum_variable_b)
  variable_name                      <- quo_name(variable)
  stratum_variable_a_name            <- quo_name(stratum_variable_a)
  stratum_variable_b_name            <- quo_name(stratum_variable_b)
  
  
  variable_levels                    <- get_variable_labels(variable_name) %>% names()
  variable_labels                    <- get_variable_labels(variable_name) %>% unname()
  stratum_variable_a_levels          <- get_variable_labels(stratum_variable_a_name) %>% names()
  stratum_variable_a_labels          <- get_variable_labels(stratum_variable_a_name) %>% unname()
  stratum_variable_b_levels          <- get_variable_labels(stratum_variable_b_name) %>% names()
  stratum_variable_b_labels          <- get_variable_labels(stratum_variable_b_name) %>% unname()
  
  if (person_analysis){
    original_data_raw    <- targets::tar_read(data_bipartite_graph_collected) %>%
                                      tidygraph::activate(nodes) %>%
                                      tidygraph::filter(type == TRUE) 
    
    simulated_data_raw   <- targets::tar_read(data_bipartite_graph_simulated) %>%
                                      tidygraph::activate(nodes) %>%
                                      tidygraph::filter(type == TRUE) 
  } else {
    original_data_raw  <- targets::tar_read(data_bipartite_graph_collected) %>%
                                      tidygraph::activate(edges)  %>% 
                                      tidygraph::filter(placeType != "home")
    
    simulated_data_raw <- targets::tar_read(data_bipartite_graph_simulated) %>%
                                      tidygraph::activate(edges) %>% 
                                      tidygraph::filter(placeType != "home")
  }
  
  
  original_data                      <- original_data_raw %>%
                                              data.frame() %>%
                                              dplyr::mutate(overall = "overall") %>%
                                              dplyr::mutate(
                                                level           = {{variable}},
                                                stratum_a       = {{stratum_variable_a}},
                                                stratum_b       = {{stratum_variable_b}}
                                              ) %>%
                                              dplyr::mutate(
                                                level = as.character(level),
                                                stratum_a = as.character(stratum_a),
                                                stratum_b = as.character(stratum_b)
                                              ) %>%
                                              # dplyr::mutate(
                                              #   level = factor(level, variable_levels, variable_labels),
                                              #   stratum_a = factor(stratum_a, stratum_variable_a_levels, stratum_variable_a_labels),
                                              #   stratum_b = factor(stratum_b, stratum_variable_b_levels, stratum_variable_b_labels)
                                              # ) %>%
                                              dplyr::group_by(level, stratum_a, stratum_b) %>%
                                              dplyr::summarize(count = n()) %>%
                                              dplyr::ungroup() %>%
                                              dplyr::group_by(stratum_a, stratum_b) %>%
                                              dplyr::mutate(proportion = count / sum(count)) 
  
  simulated_data                    <-   simulated_data_raw %>%
                                              data.frame() %>%
                                              dplyr::mutate(overall = "overall") %>%
                                              data.frame() %>%
                                              dplyr::mutate(
                                                level           = {{variable}},
                                                stratum_a       = {{stratum_variable_a}},
                                                stratum_b       = {{stratum_variable_b}}
                                              ) %>%
                                              dplyr::mutate(
                                                level = as.character(level),
                                                stratum_a = as.character(stratum_a),
                                                stratum_b = as.character(stratum_b)
                                              ) %>%
                                              # dplyr::mutate(
                                              #   level = factor(level, variable_levels, variable_labels),
                                              #   stratum_a = factor(stratum_a, stratum_variable_a_levels, stratum_variable_a_labels),
                                              #   stratum_b = factor(stratum_b, stratum_variable_b_levels, stratum_variable_b_labels)
                                              # ) %>%
                                              dplyr::group_by(rep, level, stratum_a, stratum_b) %>%
                                              dplyr::summarize(count = n()) %>%
                                              dplyr::ungroup() %>%
                                              dplyr::group_by(rep, stratum_a, stratum_b) %>%
                                              dplyr::mutate(proportion = count / sum(count)) %>%
                                              dplyr::ungroup() %>%
                                              dplyr::group_by(stratum_a, stratum_b, level) %>%
                                              dplyr::summarize(
                                                count_mean = mean(count), 
                                                count_ci_lb = quantile(count, 0.025),
                                                count_ci_ub = quantile(count, 0.975),
                                                proportion_mean = mean(proportion),
                                                proportion_ci_lb = quantile(proportion, 0.025),
                                                proportion_ci_ub = quantile(proportion, 0.975)
                                              )
  
  
  original_data %>%
          dplyr::left_join(simulated_data, by = c("level", "stratum_a", "stratum_b")) %>%
          dplyr::arrange(stratum_a, stratum_b, level) %>%
          dplyr::mutate(
            variable = variable_name,
            strata_a = stratum_variable_a_name,
            strata_b = stratum_variable_b_name) %>%
          dplyr::ungroup() %>%
          dplyr::select(variable, strata_a, strata_b, names(.)) 
  
}

make_table_freq2                <- function(variable = overall, stratum_variable = overall, person_analysis = TRUE){
  
  make_table_freq3({{variable}}, {{stratum_variable}}, person_analysis = person_analysis) %>%
    dplyr::select(-stratum_b, -strata_b) %>%
    dplyr::rename(stratum = stratum_a, strata = strata_a)
}

make_table_freq1                <- function(variable = overall, person_analysis = TRUE){
  
  make_table_freq2({{variable}}, person_analysis = person_analysis) %>%
    dplyr::select(-stratum, -strata)
}
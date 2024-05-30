make_table_freq3                <- function(variable = overall,stratum_variable_a = overall, stratum_variable_b = overall, person_analysis = TRUE){
  variable           <- enquo(variable)
  stratum_variable_a <- enquo(stratum_variable_a)
  stratum_variable_b <- enquo(stratum_variable_b)
  
  variable_name           <- quo_name(variable)
  stratum_variable_a_name <- quo_name(stratum_variable_a)
  stratum_variable_b_name <- quo_name(stratum_variable_b)
  
  get_variable_labels(variable_name)
  
  variable_levels <- get_variable_labels(variable_name)[["variable_levels"]]
  variable_labels <- get_variable_labels(variable_name)[["variable_labels"]]
  
  stratum_variable_a_levels <- get_variable_labels(stratum_variable_a_name)[["variable_levels"]]
  stratum_variable_a_labels <- get_variable_labels(stratum_variable_a_name)[["variable_labels"]]
  
  
  stratum_variable_b_levels <- get_variable_labels(stratum_variable_b_name)[["variable_levels"]]
  stratum_variable_b_labels <- get_variable_labels(stratum_variable_b_name)[["variable_labels"]]
  
  if (person_analysis){
    original_data_raw  <- targets::tar_read(bipartite_graph_coverage) %>%
      activate(nodes) %>%
      filter(type == TRUE) 
    
    simulated_data_raw <- targets::tar_read(bipartite_graph_coverage_sim) %>%
      activate(nodes) %>%
      filter(type == TRUE) 
  } else {
    original_data_raw  <- targets::tar_read(bipartite_graph_coverage) %>%
      activate(edges) 
    
    simulated_data_raw <- targets::tar_read(bipartite_graph_coverage_sim) %>%
      activate(edges)
  }
  
  
  
  
  
  original_data <- original_data_raw %>%
    data.frame() %>%
    mutate(overall = "overall") %>%
    mutate(
      level           = {{variable}},
      stratum_a       = {{stratum_variable_a}},
      stratum_b       = {{stratum_variable_b}}
    ) %>%
    mutate(
      level = factor(level, variable_levels, variable_labels),
      stratum_a = factor(stratum_a, stratum_variable_a_levels, stratum_variable_a_labels),
      stratum_b = factor(stratum_b, stratum_variable_b_levels, stratum_variable_b_labels)
    ) %>%
    group_by(level, stratum_a, stratum_b) %>%
    summarize(count = n()) %>%
    ungroup() %>%
    group_by(stratum_a, stratum_b) %>%
    mutate(proportion = count / sum(count)) 
  
  simulated_data <-   simulated_data_raw %>%
    data.frame() %>%
    mutate(overall = "overall") %>%
    data.frame() %>%
    mutate(
      level           = {{variable}},
      stratum_a       = {{stratum_variable_a}},
      stratum_b       = {{stratum_variable_b}}
    ) %>%
    mutate(
      level = factor(level, variable_levels, variable_labels),
      stratum_a = factor(stratum_a, stratum_variable_a_levels, stratum_variable_a_labels),
      stratum_b = factor(stratum_b, stratum_variable_b_levels, stratum_variable_b_labels)
    ) %>%
    group_by(rep, level, stratum_a, stratum_b) %>%
    summarize(count = n()) %>%
    ungroup() %>%
    group_by(rep, stratum_a, stratum_b) %>%
    mutate(proportion = count / sum(count)) %>%
    ungroup() %>%
    group_by(stratum_a, stratum_b, level) %>%
    summarize(
      count_mean = mean(count), 
      count_ci_lb = quantile(count, 0.025),
      count_ci_ub = quantile(count, 0.975),
      proportion_mean = mean(proportion),
      proportion_ci_lb = quantile(proportion, 0.025),
      proportion_ci_ub = quantile(proportion, 0.975)
    )
  
  
  original_data %>%
    left_join(simulated_data) %>%
    arrange(stratum_a, stratum_b, level) %>%
    mutate(
      variable = variable_name,
      strata_a = stratum_variable_a_name,
      strata_b = stratum_variable_b_name) %>%
    ungroup() %>%
    select(variable, strata_a, strata_b, names(.)) 
  
}

make_table_freq2                <- function(variable = overall, stratum_variable = overall, person_analysis = TRUE){
  
  make_table_freq3({{variable}}, {{stratum_variable}}, person_analysis = person_analysis) %>%
    select(-stratum_b, -strata_b) %>%
    rename(stratum = stratum_a, strata = strata_a)
}

make_table_freq1                <- function(variable = overall, person_analysis = TRUE){
  
  make_table_freq2({{variable}}, person_analysis = person_analysis) %>%
    select(-stratum, -strata)
}
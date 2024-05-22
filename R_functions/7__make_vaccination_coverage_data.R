make_vaccination_coverage_data <- function(data_vaccination_campaign){
  
    purrr::map(
      data_vaccination_campaign,
      function(graph){
        graph %>%
          data.frame() %>%
          tibble() %>%
          filter(type) %>%
          arrange(rep, intervention_ranking) %>%
          group_by(rep) %>%
          mutate(prop = 1/n(), cumprop = cumsum(prop))
      }) %>%
    bind_rows() %>%
    arrange(intervention_ranking, rep, strata, intervention_priority, intervention_setting) %>%
    select(intervention_priority, intervention_setting, strata, rep, intervention_ranking, names(.))
}


make_vaccination_place_data <- function(data_vaccination_campaign){
  
  purrr::map(
    data_vaccination_campaign,
    function(graph){
      graph %>%
        data.frame() %>%
        tibble() %>%
        filter(!type) %>%
        arrange(rep, intervention_ranking) %>%
        group_by(rep) %>%
        mutate(prop = 1/n(), cumprop = cumsum(prop))
    }) %>%
    bind_rows() %>%
    arrange(intervention_ranking, rep, strata, intervention_priority, intervention_setting) %>%
    select(name, intervention_priority, intervention_setting, strata, rep, intervention_ranking, names(.))
}


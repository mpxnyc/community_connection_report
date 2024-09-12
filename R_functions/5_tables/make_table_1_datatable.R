
make_table_1_datatable <- function(bipartite_graph_sim, by = groupSex, variables = c(age, genderId), person_data = TRUE){

  by                          <- rlang::enquo(by)
  variables                   <- rlang::enquo(variables)



  if (person_data){
    working_data       <- bipartite_graph_sim %>%
                                tidygraph::activate(nodes) %>%
                                tidygraph::filter(type == person_data) %>%
                                data.frame() %>%
                                dplyr::tibble()


  } else {
    working_data       <- bipartite_graph_sim %>%
                                tidygraph::activate(edges) %>%
                                data.frame() %>%
                                dplyr::tibble()


  }


  names_by                    <- working_data %>%
                                      dplyr::select({{by}}) %>%
                                      names()

  names_variables             <- working_data %>%
                                      dplyr::select({{variables}}) %>%
                                      names()

  n_reps                      <- working_data %>% pull(rep) %>% max()


  result                      <-  lapply(
                                        seq(n_reps),
                                        FUN = function(current_rep) {

                                          result <- working_data %>%
                                            dplyr::filter(rep == current_rep) %>%
                                            make_table_1_datatable_single(by = {{by}}, variables = {{variables}}) %>%
                                            dplyr::mutate(rep = current_rep)


                                          return(result)
                                        }
  ) %>%
    dplyr::bind_rows() %>%
    dplyr::group_by(rep, .dots = c(paste0(rep("stratum_", length(names_by)), names_by), "level", "variable")) %>%
    dplyr::summarize(
      count              = mean(count, na.rm = TRUE),
      proportion         = mean(proportion, na.rm = TRUE),
      chisq              = dplyr::first(chisq)
    ) %>%
    dplyr::group_by(.dots = c(paste0(rep("stratum_", length(names_by)), names_by), "level", "variable")) %>%
    dplyr::summarize(
      proportion_mean    = mean(proportion),
      count_mean         = mean(count),
      count_ci_lb        = quantile(count, 0.025, na.rm = TRUE),
      count_ci_ub        = quantile(count, 0.975, na.rm = TRUE),
      proportion_ci_lb   = quantile(proportion, 0.025, na.rm = TRUE),
      proportion_ci_ub   = quantile(proportion, 0.975, na.rm = TRUE),
      chisq              = dplyr::first(chisq)
    ) %>%
    dplyr::select(any_of(c(paste0(rep("stratum_", length(names_by)), names_by), "variable", "level")), count_mean, count_ci_lb, count_ci_ub, proportion_mean, proportion_ci_lb, proportion_ci_ub, chisq) %>%
    dplyr::ungroup()

  result
}




make_table_1_datatable_single <- function(data, by, variables){
  variables = rlang::enquo(variables)
  by        = rlang::enquo(by)

  names_by          <- data %>%
                          dplyr::select({{by}}) %>%
                          names()
  


  names_variables   <- data %>%
                          dplyr::select({{variables}}) %>%
                          names()

  working_data <- data

  names_variables %>%
    purrr::map(
      function(variable) {
        table_data          <- working_data %>%
                                        dplyr::select(any_of(c(names_by, variable))) %>%
                                        table()

        

        counts              <- table_data %>%
                                        as.data.frame() %>%
                                        rlang::set_names(c(paste0(rep("stratum_", length(names_by)), names_by), "level", "count")) %>%
                                        dplyr::mutate(variable = variable) %>%
                                        dplyr::select(variable, level, names(.))

        props               <- table_data %>%
                                        prop.table(seq_along(names_by)) %>%
                                        as.data.frame() %>%
                                        rlang::set_names(c(paste0(rep("stratum_", length(names_by)), names_by), "level", "proportion")) %>%
                                        dplyr::mutate(variable = variable) %>%
                                        dplyr::select(variable, level, names(.))

        chisq.calc     <- chisq.test(table_data)

        result              <- counts %>%
                                        dplyr::left_join(props) %>%
                                        dplyr::mutate(chisq = chisq.calc$statistic)


        result

      }) %>%
    dplyr::bind_rows() %>%
    dplyr::arrange(level) %>%
    dplyr::arrange_(paste0("stratum_", names_by)) %>%
    dplyr::select(contains("stratum"), names(.)) %>%
    dplyr::arrange(variable)

}





draw_table_1 <- function(data_table, list_labels){
  
  variables         <- data_table %>%
    dplyr::filter(!is.na(variable)) %>%
    dplyr::pull(variable) %>%
    unique()
  
  working_data     <- list()
  
  for (var in variables){
    working_data[[var]]       <- data_table %>%
      dplyr::ungroup() %>%
      dplyr::filter(variable == var) %>%
      dplyr::mutate(across(contains("proportion"), function(x) scales::percent(x, accuracy = 1))) %>%
      dplyr::mutate(result = paste0(round(count, 1), " (", proportion, "; CI:",proportion_ci_lb, " to ", proportion_ci_ub, ")")) %>%
      dplyr::mutate(stratum = factor(stratum, names(list_labels[["stratum"]][["levels"]]), list_labels[["stratum"]][["levels"]])) %>%
      tidyr::pivot_wider(values_from = result, names_from = stratum, id_cols = c(variable, level)) %>%
      dplyr::arrange(variable, level) %>%
      dplyr::mutate(across(dplyr::everything(), function(x) ifelse(is.na(x), "", as.character(x)))) %>%
      dplyr::mutate(level = factor(level, names(list_labels[[var]][["levels"]]), list_labels[[var]][["levels"]] %>% unlist())) %>%
      dplyr::mutate(variable = list_labels[[var]][["label"]]) %>%
      dplyr::add_row(variable = list_labels[[var]][["label"]], .before = 1) %>%
      dplyr::mutate(variable = ifelse(is.na(level), variable, "")) %>%
      dplyr::mutate(dplyr::across(-dplyr::any_of(c("variable", "level")), function(x) ifelse(is.na(x), "", x))) %>%
      dplyr::mutate(level = ifelse(is.na(level), "", as.character(level)))
    
  }
  
  working_data_strata          <- working_data %>%
    dplyr::bind_rows()
  
  working_data_strata %>%
    dplyr::rename(` `=variable, `  ` = level) %>%
    #gt::gt()
     knitr::kable(booktabs = TRUE, align = "llcccccccccc") %>%
     kableExtra::column_spec(1, bold = TRUE, border_right = FALSE) %>%
     kableExtra::kable_paper(full_width = FALSE) %>%
     kableExtra::kable_styling(font_size = 7, full_width = FALSE)
}

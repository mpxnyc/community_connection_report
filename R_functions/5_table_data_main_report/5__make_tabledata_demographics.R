make_tabledata_demographics <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
    tidygraph::activate(nodes)|>
    data.frame() |>
    dplyr::filter(type) |>
    dplyr::arrange(race) |>
    dplyr::mutate(race = as.character(race)) |>
    dplyr::mutate(race = ifelse(is.na(race), "Another Group", race)) |>
    dplyr::mutate(race = factor(race)) |>
    dplyr::mutate(age = factor(as.character(age))) |>
    dplyr::mutate(age = labelled::set_variable_labels(age, "Age")) |>
    dplyr::mutate(race = labelled::set_variable_labels(race, "Race")) |>
    dplyr::select("age", "race", "genderId", "sexOrientation", "groupSex") 
    
}
make_tabledata_health <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
    tidygraph::activate(nodes)|>
    data.frame() |>
    dplyr::mutate(monkeypoxVaccine = as.character(monkeypoxVaccine)) |>
    dplyr::mutate(monkeypoxVaccine = ifelse(monkeypoxVaccine == "Unsure", "No", monkeypoxVaccine)) |>
    dplyr::mutate(monkeypoxVaccine = factor(monkeypoxVaccine)) |>
    dplyr::mutate(hivPrep = as.character(hivPrep)) |>
    dplyr::mutate(hivPrep = ifelse(is.na(hivPrep), "No", hivPrep)) |>
    dplyr::mutate(hivPrep = factor(hivPrep)) |>
    dplyr::mutate(num_symptomsCut = num_symptomsCut == "1+") |>
    dplyr::mutate(num_symptomsCut = labelled::set_variable_labels(num_symptomsCut, "Any STI symptoms")) |>
    dplyr::mutate(hivPrep = labelled::set_variable_labels(hivPrep, "PrEP user")) |>
    dplyr::mutate(monkeypoxTest = labelled::set_variable_labels(monkeypoxTest, "MPOX tested")) |>
    dplyr::mutate(monkeypoxVaccine = labelled::set_variable_labels(monkeypoxVaccine, "MPOX vaccinated")) |>
    dplyr::filter(type) |>
    dplyr::select(
      "hivStatus", "hivSuppressed", "num_symptomsCut", "hivPrep", "monkeypoxTest", "monkeypoxVaccine", "groupSex"
    )
}
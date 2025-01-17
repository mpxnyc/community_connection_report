make_table_movement_travel        <- function(){
  
  home_data                 <-  targets::tar_read(data_bipartite_graph_collected) |>
                                        tidygraph::activate(edges) |>
                                        tidygraph::filter(home) |>
                                        tidygraph::mutate(person_name = tidygraph::.N()$name[from]) |>
                                        tidygraph::mutate(home_name = tidygraph::.N()$name[to]) |>
                                        tidygraph::mutate(censusTract = tidygraph::.N()$censusTractHome[from]) |>
                                        tidygraph::mutate(home_borough = mpxnyc::convert_spatial_unit_ny(censusTract, convert_to = "borough")) |>
                                        data.frame() |>
                                        dplyr::transmute(home_name, person_name, home_borough) |>
    dplyr::tibble()
  
  place_data                <-  targets::tar_read(data_bipartite_graph_collected) |>
                                        tidygraph::activate(edges) |>
                                        tidygraph::filter(!home) |>
                                        tidygraph::mutate(person_name = tidygraph::.N()$name[from]) |>
                                        tidygraph::mutate(place_name = tidygraph::.N()$name[to]) |>
                                        data.frame() |>
                                        dplyr::select(place_name, person_name, place_borough) |>
                                        dplyr::tibble()
  
  home_data_with_borough    <- place_data |>
                                        dplyr::left_join(home_data, by = "person_name")
  

  
  home_data_with_borough |> 
        dplyr::rename(from = home_name, to = place_name, from_borough = home_borough, to_borough = place_borough) |>
        dplyr::group_by(from, to, from_borough, to_borough) |>
        dplyr::summarize(weight = dplyr::n()) |>
        dplyr::ungroup()
  
  
}
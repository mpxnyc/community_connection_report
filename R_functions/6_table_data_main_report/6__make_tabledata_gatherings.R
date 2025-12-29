make_tabledata_gatherings <- function(
    data_bipartite_graph_collected =  targets::tar_read(data_bipartite_graph_collected)
){
  data_bipartite_graph_collected |>
    tidygraph::activate(edges)|>
    data.frame() |>
    dplyr::group_by(place_borough, place_community, place_neighborhood) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::rename(borough = place_borough, community = place_community, neighborhood = place_neighborhood) |>
    dplyr::arrange(-count) |>
    dplyr::ungroup() |>
    dplyr::filter(!is.na(borough)) |>
    dplyr::mutate(proportion = count / sum(count))
}
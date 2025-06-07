make_tabledata_gatherings <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
    tidygraph::activate(nodes)|>
    data.frame() |>
    dplyr::filter(type) |>
    dplyr::group_by(borough, community, neighborhood) |>
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::arrange(-count) |>
    dplyr::ungroup()
}
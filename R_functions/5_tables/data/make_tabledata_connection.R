make_tabledata_connection <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
    tidygraph::activate(nodes)|>
    data.frame() |>
    dplyr::filter(type) |>
    dplyr::select(
      "groupSex","countFriendsCut", "countPhysicalCut", "countSexCut", "travelTimeCut"
    )
}
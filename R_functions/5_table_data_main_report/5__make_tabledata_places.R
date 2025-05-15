make_tabledata_places <- function(){
  targets::tar_read(data_bipartite_graph_collected) |>
    tidygraph::activate(edges) |>
    data.frame() |>
    dplyr::filter(!home) |>
    dplyr::select("placeSex", "placeType", "place_borough", "distanceFromHome") 
}
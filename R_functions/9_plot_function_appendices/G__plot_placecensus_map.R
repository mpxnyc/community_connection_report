plot_placecensus_map        <- function(data){
  
data |>
    dplyr::pull(stratum) |>
    unique() |>
    purrr::map(
      function(x) {
        mpxnyc::community_sf_obj |>
          sf::st_as_sf() |>
          dplyr::filter(!stringr::str_detect(community, "SI")) |>
          dplyr::rename(name = 1) |>
          dplyr::left_join(data |> dplyr::filter(stratum == x), by = "name") |>
          dplyr::mutate(stratum = x)
      }
    ) |>
    dplyr::bind_rows() |>
    ggplot2::ggplot() +
    ggplot2::geom_sf(fill = "grey", color = "white") +
    ggplot2::geom_sf(ggplot2::aes(fill = group, group = name), color = "white", linewidth = 0.5) + 
    gganimate::transition_states(stratum, state_length = 30, transition_length = 1) +
    ggplot2::labs(title = "{closest_state}") 
  

}
plot_coverage_map        <- function(data){
  
  working_data <- data |>
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
    dplyr::bind_rows()
  

  working_data |>
    ggplot2::ggplot() +
    ggplot2::geom_sf(fill = "grey", color = "white") +
    ggplot2::geom_sf(ggplot2::aes(fill = group), color = "white", linewidth = 0.5) + 
    ggplot2::facet_wrap(stratum ~ ., strip.position = "left", ncol = 1) +
    ggrepel::geom_label_repel(
      ggplot2::aes(label = name, geometry = geometry, fill = group),
      stat = "sf_coordinates",
      data = subset(working_data, group == "Group A"),
      min.segment.length = 0, # Always draw lines
      size = 6,
      force = 100,             # Force labels away from each other
      direction = "y",
      alpha = 0.7,
      nudge_x = -25000,
      nudge_y = 25000,   # Nudge labels to the right,
      linecolor = "grey",
      linewidth = 2,
      show.legend = FALSE
    ) 

}
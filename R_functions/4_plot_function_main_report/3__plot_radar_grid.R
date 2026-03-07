plot_radar_grid       <- function(data){
  
  if (is.null(data[["stratum"]])) {
    working_data <- data |>
      dplyr::mutate(stratum = "overall")
  } else {
    working_data <- data
  }
  
  
  strata <- working_data$stratum |> as.character() |> unique()
  
  overall_data <- strata |>
    purrr::map(
      function(x) working_data |> dplyr::filter(stratum == "Overall") |> dplyr::mutate(stratum = x)
    ) |>
    dplyr::bind_rows()
    
  
working_data |>
    dplyr::filter(!is.na(stratum)) |>
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      ggplot2::aes(x = level, y = proportion),
      alpha = 1, 
      stat = "identity",
      width = 1, 
      color = "black",
      data = overall_data,
      linewidth = 0,
      fill = "#cccccc"
    ) +
    ggplot2::geom_bar(
      ggplot2::aes(x = level, y = proportion, fill = level), 
      stat = "identity",
      width = 1, 
      color = "black",
      alpha = 0.5
    ) +
    #ggplot2::facet_wrap(. ~ stratum, labeller = ggplot2::label_wrap_gen(width = 10)) +
    gganimate::transition_states(stratum, state_length = 100, transition_length = 1) +
    ggplot2::coord_polar() +
    ggplot2::theme_void()  +
    ggplot2::labs(title = "{previous_state}") 

}
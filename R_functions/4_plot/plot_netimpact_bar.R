plot_netimpact_bar             <- function(data){
  data %>%
    filter(name == "lcc") %>%
    ggplot2::ggplot() +
    ggplot2::geom_bar(
      aes(x = intervention_ranking, y = est, fill = name), 
      stat = "identity", 
      color = "black"
    ) 
}
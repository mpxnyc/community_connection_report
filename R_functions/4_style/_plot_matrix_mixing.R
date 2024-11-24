plot_matrix_mixing         <- function(data){
  
  data %>%
    mutate(label_est_text = scales::percent(mean_bias - 1, accuracy = 1)) %>%
    mutate(significant = log(ci_lb_bias) * log(cl_ub_bias) > 0) %>%
    ggplot() +
    geom_tile(aes(y = from_level, x = to_level, fill = log(mean_bias)), color = "white", size = 5) +
    geom_text(aes(y = from_level, x = to_level, label = label_est_text, fill = log(mean_bias), alpha = significant), size = 5) +
    theme_void() +
    theme(
      axis.text.x = element_text(),
      axis.text.y = element_text(),
      axis.title = element_blank()
    ) 
}
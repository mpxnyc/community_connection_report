plot_matrix_mixing         <- function(data){
  
  data %>%
    mutate(label_est_text = scales::percent(mean_bias - 1, accuracy = 1)) %>%
    mutate(significant = log(ci_lb_bias) * log(cl_ub_bias) > 0) %>%
    ggplot() +
    geom_point(aes(y = from_level, x = to_level, color = log(mean_bias)), size = 40) +
    geom_text(aes(y = from_level, x = to_level, label = label_est_text, alpha = significant), size = 10) +
    theme_void() +
    theme(
      axis.text.x = element_text(),
      axis.text.y = element_text(),
      axis.title = element_blank()
    ) +
    scale_x_discrete(drop = FALSE) +
    scale_x_discrete(drop = FALSE) 
}
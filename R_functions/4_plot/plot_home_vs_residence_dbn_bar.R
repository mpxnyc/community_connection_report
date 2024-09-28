plot_home_vs_residence_dbn_bar <- function(data){
  
  horizontal_lines <- data.frame(y_intercept = seq(-0.12, 0.16, by = 0.02))
  
  annotation_labels <- data.frame(
    x = c(10, 10),
    y = c(0.12, -0.08),
    label = c("Distribution of\ncontact venues", "Distribution of\nresidences")
  )
  
  ggplot(data) +
    geom_bar(
      aes(x = community, y = weight, fill = borough, alpha = highlight), 
      stat = "identity", 
      size = 0.6, 
      width = 0.8
    ) +
    geom_bar(
      aes(x = community, y = weight), 
      fill = "lightgrey", 
      stat = "identity", 
      size = 0.6, 
      width = 0.8, 
      data = . %>% filter(weight < 0)
    ) +
    
    geom_hline(aes(yintercept = y_intercept), color = "lightgrey", size = 0.3, data = horizontal_lines) +
    geom_hline(aes(yintercept = 0), color = "white", size = 1) +
    geom_label(aes(x = x, y = y, label = label),  annotation_labels) 
  
}
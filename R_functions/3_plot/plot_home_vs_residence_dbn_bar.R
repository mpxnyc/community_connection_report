plot_home_vs_residence_dbn_bar <- function(data){
  
  horizontal_lines <- data.frame(y_intercept = seq(-0.08, 0.08, by = 0.02))
  
  annotation_labels <- data.frame(
                                    x = c(10, 10),
                                    y = c(0.12, -0.08),
                                    label = c("Distribution of\ncontact venues", "Distribution of\nresidences")
                                  )
  
  ggplot2::ggplot(data) +
    ggplot2::geom_bar(
      ggplot2::aes(x = community, y = weight, fill = borough), 
      stat = "identity", 
      size = 0.6, 
      width = 0.8,
      color = "black",
      position = "dodge"
    ) 
  
}
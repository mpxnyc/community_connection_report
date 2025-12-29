plot_recruitment_linegraph <- function(data){
  ggplot2::ggplot(data) +
      ggplot2::geom_line(ggplot2::aes(x = createdAt, y = count), size = 1) +
      ggplot2::geom_point(ggplot2::aes(x = createdAt, y = count), size = 4, color = "#F73C95", alpha = 0.5) +
    ggplot2::geom_label(ggplot2::aes(x = createdAt, y = count, label = createdAtLabel), data = subset(data, labelled), hjust = -0.3, vjust = -0.3, fill = "black", color = "white") +
      theme_mpxnyc_bar() +
      ggplot2::scale_y_continuous("Count of new participants", limits = c(0, 700)) +
      ggplot2::scale_x_date("Date of participant") +
      ggplot2::theme(
        axis.text.x = ggplot2::element_text(margin = ggplot2::margin(0.5,0.5, 0, 0.5, "cm"), size = 10),
        axis.text.y = ggplot2::element_text(margin = ggplot2::margin(0.5, 0.5, 0.5, 0.5, "cm"), size = 10),
        axis.title.y = ggplot2::element_text( size = 10),
        panel.grid.major = ggplot2::element_line(color = "grey"),
        plot.margin = ggplot2::unit(c(0, 0, 0, 0),"pt")
      )
}
plot_recruitment_linegraph <- function(data){
  ggplot2::ggplot(data) +
      ggplot2::geom_line(ggplot2::aes(x = createdAt, y = count), size = 1) +
      ggplot2::geom_point(ggplot2::aes(x = createdAt, y = count), size = 2) +
      theme_mpxnyc_bar() +
      ggplot2::scale_y_continuous("Count of new participants") +
      ggplot2::scale_x_date("Date of participant") +
      ggplot2::theme(
        axis.text.x = ggplot2::element_text(margin = ggplot2::margin(0.5,0.5, 0, 0.5, "cm"), size = 10),
        axis.text.y = ggplot2::element_text(margin = ggplot2::margin(0.5, 0.5, 0.5, 0, "cm"), size = 10)
      )
}
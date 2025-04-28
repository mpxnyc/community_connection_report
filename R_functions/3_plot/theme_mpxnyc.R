mpxnyc_all <- function(n){
  c("#F73C95", 
    "#FF99C5", 
    "#009BE8", 
    "#41BFFF", 
    "#C5EFFF", 
    "#5D207A", 
    "#7F3F98", 
    "#9E7ACC", 
    "#459B0E", 
    "#59C618", 
    "#EA773D", 
    "#FFAA7B", 
    "#844D28", 
    "#D89000", 
    "#FFCD2E")[1:n]
}

mpxnyc_light <- function(n){
  c(
    "#FF99C5", 
    "#009BE8", 
    "#C5EFFF", 
    "#9E7ACC", 
    "#59C618", 
    "#EA773D", 
    "#FFAA7B", 
    "#D89000", 
    "#FFCD2E"
  )[1:n]
}

mpxnyc_dark <- function(n){
  c("#F73C95",
    "#009BE8", 
    "#5D207A", 
    "#7F3F98", 
    "#459B0E", 
    "#844D28")[1:n]
}

mpxnyc_colors <- function(option){
  if (option == "all") return(mpxnyc_all)
  if (option == "light") return(mpxnyc_light)
  if (option == "dark") return(mpxnyc_dark)
}

scale_fill_mpxnyc <- function(..., option = "all", aesthetics = "fill") {
  ggplot2::discrete_scale(
    ...,
    aesthetics = aesthetics, 
    palette = mpxnyc_colors(option = option)
  )
}

scale_color_mpxnyc <- function(...){
  scale_fill_mpxnyc(..., aesthetics = "color")
}

scale_fill_mpxnyc_gradient <- function(...){
  ggplot2::scale_fill_gradient2(..., low = mpxnyc_dark(2)[2], high = mpxnyc_dark(2)[1], mid = "white")
}

scale_color_mpxnyc_gradient <- function(...){
  ggplot2::scale_color_gradient2(..., low = mpxnyc_dark(2)[2], high = mpxnyc_dark(2)[1], mid = "white")
}



theme_mpxnyc <- function(base_size = 11, 
                          base_family = "", 
                          base_line_size = base_size/22, 
                          base_rect_size = base_size/22) {
  ggplot2::theme_bw(
    base_size = base_size, 
    base_family = base_family, 
    base_line_size = base_line_size, 
    base_rect_size = base_rect_size
  ) +
    ggplot2::theme(
        axis.ticks             = ggplot2::element_blank(), 
        legend.background      = ggplot2::element_blank(), 
        legend.key             = ggplot2::element_blank(), 
        panel.background       = ggplot2::element_rect(fill = "white", color = "white"),
        panel.grid             = ggplot2::element_blank(), 
        plot.margin            = ggplot2::margin(50, 50, 50, 50),
        strip.background       = ggplot2::element_blank(), 
        plot.background        = ggplot2::element_rect(fill = "white", color = "white"),
        axis.text              = ggplot2::element_blank(),
        axis.title             = ggplot2::element_blank(),
        legend.position        = "none", 
        complete               = TRUE,
        text                   = ggplot2::element_text()

    )
  
  
}

theme_mpxnyc_large <- function(base_size = 11, 
                         base_family = "", 
                         base_line_size = base_size/22, 
                         base_rect_size = base_size/22) {
  ggplot2::theme_bw(
    base_size = base_size, 
    base_family = base_family, 
    base_line_size = base_line_size, 
    base_rect_size = base_rect_size
  ) +
    ggplot2::theme(
      axis.ticks             = ggplot2::element_blank(), 
      legend.background      = ggplot2::element_blank(), 
      legend.key             = ggplot2::element_blank(), 
      panel.background       = ggplot2::element_rect(fill = "white", color = "white"),
      panel.border           = ggplot2::element_blank(), 
      panel.grid             = ggplot2::element_blank(), 
      plot.margin            = ggplot2::margin(0, 0, 0, 0),
      strip.background       = ggplot2::element_blank(), 
      plot.background        = ggplot2::element_rect(fill = "white", color = "white"),
      axis.text              = ggplot2::element_blank(),
      axis.title             = ggplot2::element_blank(),
      legend.position        = "bottom", 
      complete               = TRUE,
      text                   = ggplot2::element_text()
      
    )
  
  
}


theme_mpxnyc_text <- function(base_size = 11, 
                              base_family = "", 
                              base_line_size = base_size/22, 
                              base_rect_size = base_size/22
                              ){
  ggplot2::theme_bw(
    base_size = base_size, 
    base_family = base_family, 
    base_line_size = base_line_size, 
    base_rect_size = base_rect_size
  ) +
    ggplot2::theme(
      axis.text        = ggplot2::element_text(),
      axis.title       = ggplot2::element_blank(),
      legend.position  = "bottom",
      panel.margin     = ggplot2::margin(1,1,1,1, "cm"),
      plot.caption     = ggplot2::element_text( hjust = 0.5),
      plot.title       = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 1, 0, "mm")),
      plot.subtitle    = ggplot2::element_text(hjust = 0.5, margin = ggplot2::margin(0, 0, 15, 0, "mm")),
      plot.background  = ggplot2::element_rect(fill = "white", color = "white"),
      panel.background = ggplot2::element_rect(fill = "white", color = "white")
    )
  
}

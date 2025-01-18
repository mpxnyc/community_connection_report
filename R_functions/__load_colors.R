load_colors <- function(){
  

#image_read_svg('R_resources/MPX_taco.svg', width = 350)


  
  
colors <- list()

colors[["dark_pink"]]      <- "#F73C95"
colors[["light_pink"]]     <- "#FF99C5"
colors[["dark_blue"]]      <- "#009BE8"
colors[["mid_blue"]]       <- "#41BFFF"
colors[["light_blue"]]     <- "#C5EFFF"

colors[["dark_purple"]]    <- "#5D207A"
colors[["mid_purple"]]     <- "#7F3F98"
colors[["light_purple"]]   <- "#9E7ACC"
colors[["dark_green"]]     <- "#459B0E"
colors[["light_green"]]    <- "#59C618"

colors[["dark_orange"]]    <- "#EA773D"
colors[["light_orange"]]   <- "#FFAA7B"
colors[["dark_brown"]]     <- "#844D28"
colors[["mid_brown"]]      <- "#D89000"
colors[["light_brown"]]    <- "#FFCD2E"

colors[["all_colors"]]     <- colors |> unlist() 
names(colors[["all_colors"]]) <- NULL

colors

}



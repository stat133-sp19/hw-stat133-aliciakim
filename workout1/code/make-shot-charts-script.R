#title: make-shots-charts
#description: creating player shot charts
#inputs: /data : andre-iguodala.csv, graymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
#outputs: /images : .jpg

library(ggplot2)
library(jpeg)
library(grid)


klay <- all_players[all_players$name == "Klay Thompson", c("x", "y", "shot_made_flag")]
klay

klay_scatterplot <- ggplot(data = klay) + geom_point(aes(x=x, y=y, color = shot_made_flag))
klay_scatterplot

#court image (used as background of plot)
court_file <- "R/Stat 133/workout1/images/nba-court.jpg"

#creating raste object
court_image <- rasterGrob(readJPEG(court_file), width = unit(1,"npc"), height = unit(1, "npc"))

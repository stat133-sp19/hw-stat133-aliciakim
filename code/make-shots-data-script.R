#title: make-shots-data
#description: collects all player csv data into one
#inputs: andre-iguodala.csv, graymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
#outputs: shots-data.csv 

library(dplyr)

iguodala <- read.csv("R/Stat 133/workout1/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("R/Stat 133/workout1/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("R/Stat 133/workout1/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("R/Stat 133/workout1/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("R/Stat 133/workout1/data/stephen-curry.csv", stringsAsFactors = FALSE)

curry <- mutate(curry, name = "Stephen Curry")
iguodala <- mutate(iguodala, name = "Andre Iguodala")
green <- mutate(green, name = "Draymond Green")
durant <- mutate(durant, name = "Kevin Durant")
thompson <- mutate(thompson, name = "Klay Thompson")


#converting shot_made_flag to readable shot_yes and shot_no values
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"

green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"

durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"

thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"

curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"


#adding minute column
iguodala <- mutate(iguodala, minutes = ((period * 12) - minutes_remaining))
green <- mutate(green, minutes = ((period * 12) - minutes_remaining))
durant <- mutate(durant, minutes = ((period * 12) - minutes_remaining))
thompson <- mutate(thompson, minutes = ((period * 12) - minutes_remaining))
curry <- mutate(curry, minutes = ((period * 12) - minutes_remaining))


#sinking to output files
sink("R/Stat 133/workout1/output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("R/Stat 133/workout1/output/draymond-green-summary.txt")
summary(green)
sink()

sink("R/Stat 133/workout1/output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("R/Stat 133/workout1/output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("R/Stat 133/workout1/output/stephen-curry")
summary(curry)
sink()


#stacking the tables into one dataframe and 
#sending it to a csv file in data
#and to a txt file in output
all_players <- rbind(iguodala, green, durant, thompson, curry)

sink("R/Stat 133/workout1/data/shots-data.csv")
all_players
sink()

sink("R/Stat 133/workout1/output/shots-data-summary.txt")
summary(all_players)
sink()

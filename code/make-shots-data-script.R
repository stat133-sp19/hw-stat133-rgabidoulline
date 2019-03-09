### Make Shots Data Script

## Description: This script takes the raw .csv files containing shot data for each particular player and combines them, adding/changing some variables for easier usability. This will create a single csv file that can be used for visualization purposes.

## Inputs:
# andre-iguodala.csv
# draymond-green.csv
# kevin-durant.csv
# klay-thompson.csv
# stephen-curry.csv

## Outputs: 
# shots-data.csv (table, which will be exported to the data folder, containing shot data for all players)
# shots-data-summary.txt (text file containing a summary of the assembled table, exported to output folder)
# andre-iguodala-summary.txt
# draymond-green-summary.txt
# kevin-durant-summary.txt
# klay-thompson-summary.txt
# stephen-curry-summary.txt (text files containing summaries of each individual player, exported to output folder)


####

# load packages
library(dplyr)

# read data sets
iguodala = read.csv("./data/andre-iguodala.csv", header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer"))
green = read.csv("./data/draymond-green.csv", header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer"))
durant = read.csv("./data/kevin-durant.csv", header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer"))
thompson = read.csv("./data/klay-thompson.csv", header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer"))
curry = read.csv("./data/stephen-curry.csv", header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "character", "integer", "integer", "integer", "integer", "character", "factor", "factor", "integer", "factor", "integer", "integer"))

# adding more descriptive values to shot_made_flag
iguodala$shot_made_flag[which(iguodala$shot_made_flag == "y")] = "shot_yes"
iguodala$shot_made_flag[which(iguodala$shot_made_flag == "n")] = "shot_no"

green$shot_made_flag[which(green$shot_made_flag == "y")] = "shot_yes"
green$shot_made_flag[which(green$shot_made_flag == "n")] = "shot_no"

durant$shot_made_flag[which(durant$shot_made_flag == "y")] = "shot_yes"
durant$shot_made_flag[which(durant$shot_made_flag == "n")] = "shot_no"

thompson$shot_made_flag[which(thompson$shot_made_flag == "y")] = "shot_yes"
thompson$shot_made_flag[which(thompson$shot_made_flag == "n")] = "shot_no"

curry$shot_made_flag[which(curry$shot_made_flag == "y")] = "shot_yes"
curry$shot_made_flag[which(curry$shot_made_flag == "n")] = "shot_no"

# add a column containing the minute when the shot occurs
mutate(iguodala, minute = (period*12) - minutes_remaining)
mutate(green, minute = (period*12) - minutes_remaining)
mutate(durant, minute = (period*12) - minutes_remaining)
mutate(thompson, minute = (period*12) - minutes_remaining)
mutate(curry, minute = (period*12) - minutes_remaining)

# sending a summary of each player's table to output/
sink(file = './output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = './output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = './output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = './output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = './output/stephen-curry-summary.txt')
summary(curry)
sink()

# stack tables into a single data frame
shots_data = rbind(iguodala, green, durant, thompson, curry)

# exporting table to data/
sink(file = './data/shots-data.csv')
shots_data
sink()

# exporting shots data summary
sink(file = './output/shots-data-summary.txt')
summary(shots_data)
sink()


### End script


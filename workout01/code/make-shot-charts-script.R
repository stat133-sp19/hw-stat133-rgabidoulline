### Make Shot Charts Script

## Description: This script creates shot charts for each player.

## Inputs:
# andre-iguodala.csv
# draymond-green.csv
# kevin-durant.csv
# klay-thompson.csv
# stephen-curry.csv

## Outputs:
# shot charts for each player (5 players) in the form of first-last-shot-chart.pdf, saved in the images/ folder
# gsw-shot-charts.pdf (facetted shot charts for all players, saved in images/ folder)


####

# load packages
library(ggplot2)
library(dplyr)
library(jpeg)
library(grid)

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

# downloading court image for background of chart
pic_url = "https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg"
download.file(url = pic_url, destfile = "./images/nba-court.jpg")
court_file = "./images/nba-court.jpg"
# create raste object
court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

# shot charts for each player
andre_shot_chart = ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

draymond_shot_chart = ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

kevin_shot_chart = ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

klay_shot_chart = ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

steph_shot_chart = ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

# save plots
ggsave('andre-iguodala-shot-chart.pdf', plot = andre_shot_chart, path = './images', width = 6.5, height = 5, units = "in")
ggsave('draymond-green-shot-chart.pdf', plot = draymond_shot_chart, path = './images', width = 6.5, height = 5, units = "in")
ggsave('kevin-durant-shot-chart.pdf', plot = kevin_shot_chart, path = './images', width = 6.5, height = 5, units = "in")
ggsave('klay-thompson-shot-chart.pdf', plot = klay_shot_chart, path = './images', width = 6.5, height = 5, units = "in")
ggsave('stephen-curry-shot-chart.pdf', plot = steph_shot_chart, path = './images', width = 6.5, height = 5, units = "in")

# save Thompson and Iguodala plots as png for example in report
ggsave('andre-iguodala-shot-chart.png', plot = andre_shot_chart, path = './images', width = 6.5, height = 5, units = "in")
ggsave('klay-thompson-shot-chart.png', plot = klay_shot_chart, path = './images', width = 6.5, height = 5, units = "in")


# adding player names to the data frames
iguodala = mutate(iguodala, player = "Andre Iguodala")
green = mutate(green, player = "Draymond Green")
durant = mutate(durant, player = "Kevin Durant")
thompson = mutate(thompson, player = "Klay Thompson")
curry = mutate(curry, player = "Stephen Curry")

# facetted shot chart
shots_data = rbind(iguodala, green, durant, thompson, curry)
gsw_shot_charts = ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag), size = .5) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ player) +
  theme_minimal()

# save facetted shot chart as pdf and png
ggsave('gsw-shot-charts.pdf', plot = gsw_shot_charts, path = './images', width = 8, height = 7, units = "in")
ggsave('gsw-shot-charts.png', plot = gsw_shot_charts, path = './images', width = 8, height = 7, units = "in")




### End script

### Make GSW Points Graph Script

## Description: This script makes a graph of frequency of points scored on GSW.

## Inputs:
# nba2018-players.csv

## Outputs: 
# gsw-points-graph.png (found in images/ folder)

####

# load packages
library(ggplot2)
library(dplyr)

# read data set
GSW_points = read.csv('./data/nba2018-players.csv', header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "factor", "factor", "integer", "integer", "integer", "integer", "character", "real", "integer", "integer", "integer", "integer", "integer", "integer"))

# filter data set
GSW_points = filter(GSW_points, team == 'GSW')

# create plot
GSW_plot = ggplot(data = GSW_points, aes(x = reorder(player, points), y = points, label = player)) +
  geom_point() + 
  geom_text(data = subset(GSW_points, (player == "Andre Iguodala" | player == "Draymond Green" | player == "Kevin Durant" | player == "Klay Thompson" | player == "Stephen Curry")), aes(vjust = -.7)) +
  ggtitle('Density of Points Scored by GSW Players (2016 season)') + 
  xlab('Player') + 
  ylab('Points Scored') + 
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  geom_hline(yintercept = mean(GSW_points$points), color="red", aes()) + 
  geom_text(aes(3, mean(GSW_points$points) ,label = "Mean Points Scored", vjust = -1))

# save plot
ggsave('gsw-points-graph.png', plot = GSW_plot, path = './images', width = 8, height = 7, units = "in")





### End script


### Make Total Points Table Script

## Description: This script will create a table with all NBA player points in 2016, then will arrange it by total points to see where GSW ranks among other teams. It will also output the sum of points scored by Iguodala, Green, Durant, Thompson, and Curry. This will be used for background information in the final report.

## Inputs: 
# nba2018-players.csv

## Outputs:
# nba-teams-pts-ranked.txt (table ranking all nba teams by points scored, exported to output/ folder)
# sum-players.txt (sum of GSW players points, exported to output/ folder)


####

# load packages
library(dplyr)

# load data
nba_pts = read.csv('./data/nba2018-players.csv', header = TRUE, stringsAsFactors = FALSE, colClasses = c("character", "factor", "factor", "integer", "integer", "integer", "integer", "character", "real", "integer", "integer", "integer", "integer", "integer", "integer"))

# create and export summary
sink('./output/nba-teams-pts-ranked.txt')
arrange(
  summarise(
    group_by(nba_pts, team),
    total_points = sum(points),
    avg_points = mean(points),
    median_points = median(points)),
  desc(avg_points)
)
sink()

# create and export points by specific players
sink('./output/sum-players.txt')
select(
  filter(nba_pts, (player == "Andre Iguodala" | player == "Draymond Green" | player == "Kevin Durant" | player == "Klay Thompson" | player == "Stephen Curry")),
  player, points
)
summarise(
  nba_pts,
  sum_GSW_points = sum(nba_pts$points[(player == "Andre Iguodala" | player == "Draymond Green" | player == "Kevin Durant" | player == "Klay Thompson" | player == "Stephen Curry")])
)
sink()




### End script







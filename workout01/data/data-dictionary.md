## Data Dictionary

| variable          | plot_name                   | description                                                                                               |
|-------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------|
| team_name         | Team                        | Name of player's team                                                                                     |
| game_date         | Date of Game                | Date the game was played                                                                                  |
| season            | Season                      | Year of the season during which game was played                                                           |
| period            | Period                      | Period of the game. An NBA game is 4 periods of 12 minutes.                                               |
| minutes_remaining | Minutes Remaining in Period | Amount of time in minutes remaining to be played in a given period.                                       |
| seconds_remaining | Seconds Remaining in Period | Amount of time in seconds remaining to be played in a given period.                                       |
| shot_made_flag    | Shot Made?                  | Indicator for whether or not a shot was made. Takes values "y" for a made shot and "n" for a missed shot. |
| action_type       | Basketball Move             | Basketball move performed to pass defenders to gain access to the basket or make a pass.                  |
| shot_type         | Shot Type                   | Indicates whether a shot is a 2-point field goal or a 3-point field goal.                                 |
| shot_distance     | Distance to Basket (ft)     | Distance to the basket during the shot, measured in feet.                                                 |
| opponent          | Opponent                    | Opposing team played.                                                                                     |
| x                 | x-Court Coordinate (in)     | x-coordinate of the player with respect to the court during the shot. Measured in inches.                 |
| y                 | y-Court Coordinate (in)     | y-coordinate of the player with respect to the court during the shot. Measured in inches.                 |

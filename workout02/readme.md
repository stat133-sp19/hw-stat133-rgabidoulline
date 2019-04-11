## Workout 02: Shiny App
#### Author: Ruslan Gabidoulline
#### Due Date: April 17, 2019

***

The purpose of this assignment is to create an interactive visualization of investment scenarios (which we saw in warmup 6).  

The app.R is found in the app/ folder, as well as at the following link:  

[https://rgabidoulline.shinyapps.io/workout02/](https://rgabidoulline.shinyapps.io/workout02/)  

### Inputs
* Initial Amount: initial amount invested at time 0
     i. Slider input for Initial Amount, from $0 to $100,000, in steps of $500. Default value of
$1,000

* Annual Contribution: contribution deposited into savings account annually
     i. Slider input for Annual Contribution, from $0 to $50,000, in steps of $500. Default
value of $2,000.

* Return Rate: annual rate of return, in percent.
     i. Slider input for Return Rate in percentage, from 0% to 20%, in steps of 0.1%. Default
value of 5%.

* Growth rate: annual growth rate of additional investment
     i. Slider input for Growth Rate in percentage, from 0% to 20%, in steps of 0.1%. Default
value of 2%.

* Years: years since initial investment
     i. Slider input for Years, from 0 to 50, in steps of 1. Default value of 20.

* Facet?: whether or not to display a faceted chart
     i.  Select input for Facet?. Choices: “No”, and “Yes”.

### Outputs

* Timeline graphs: graphs showing the change in balance over time for each investment strategy.

* Balance table: table showing the exact balance over time for each investment strategy.


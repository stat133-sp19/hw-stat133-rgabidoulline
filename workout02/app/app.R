## Workout 02 Shinyapp
## Author: Ruslan Gabidoulline
## Date: Due April 17
## Description: Runs a shiny app with investing data from Warmup 6

library(shiny)
library(ggplot2)

# Source functions from warmup 6
#' @title future value function
#' @description computes the future value of investment
#' @param amount initial invested amount
#' @param rate annual rate of return
#' @param years number of years
#' @return future value
future_value = function(amount, rate, years) {
  FV = amount * (1 + rate)^years
  return(FV)
}

###

#' @title future value of annuity
#' @description computes the future value annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param years number of years
#' @return future value
annuity = function(contrib, rate, years) {
  FVA = contrib * ((1 + rate)^years - 1) / (rate)
  return(FVA)
}

###

#' @title future value of growing annuity
#' @description computes the future value of growing annuity
#' @param contrib contributed amount
#' @param rate annual rate of return
#' @param growth annual growth rate
#' @param years number of years
#' @return future value
growing_annuity = function(contrib, rate, growth, years) {
  FVGA = contrib * (( (1 + rate)^years - (1 + growth)^years ) / (rate - growth))
  return(FVGA)
}

# Define UI
ui <- fluidPage(
   
   # Application title
   titlePanel("Workout 02: Savings Simulation"),
   h4("Ruslan Gabidoulline"),
   hr(),
   br(),
   
   # header with a slider input for number of bins 
   verticalLayout(
     flowLayout(
         sliderInput("initial",
                     "Initial Amount",
                     min = 0,
                     max = 100000,
                     step = 500,
                     value = 1000),
         sliderInput("return",
                     "Return Rate (in %)",
                     min = 0,
                     max = 20,
                     step = 0.1,
                     value = 5),
         sliderInput("years",
                     "Years",
                     min = 0,
                     max = 50,
                     step = 1,
                     value = 20)
     ),
     
      flowLayout(
         sliderInput("annual",
                     "Annual Contribution",
                     min = 0,
                     max = 50000,
                     step = 500,
                     value = 2000),
      sliderInput("growth",
                  "Growth Rate (in %)",
                  min = 0,
                  max = 20,
                  step = 0.1,
                  value = 2),
      selectInput("facet",
                  "Facet?",
                  c("No", "Yes"))
      ),
      
      # Show a plot of the generated distribution
      hr(),
      h2("Timelines"),
         plotOutput("timelines"),
      h2("Balances"),
         verbatimTextOutput("balances")
      )
     )

# Define server logic
server <- function(input, output) {
   
  # Computing the yearly balance for each mode
   no_contrib = reactive({
     
     year = 0:input$years
     amount = input$initial
     rate = input$return * 0.01
     contrib = input$annual
     growth = input$growth * 0.01
     
     no_contrib = rep(0, length(year))
     
     for (i in year) {
       NC = future_value(amount = amount, rate = rate, years = i)
       no_contrib[i + 1] = NC
     }
     return(no_contrib)
   })
   
   fixed_contrib = reactive({
     
     year = 0:input$years
     amount = input$initial
     rate = input$return * 0.01
     contrib = input$annual
     growth = input$growth * 0.01
     
     fixed_contrib = rep(0, length(year))
     
     for (i in year) {
       FC = future_value(amount = amount, rate = rate, years = i) + 
         annuity(contrib = contrib, rate = rate, years = i)
       fixed_contrib[i + 1] = FC
     }
     return(fixed_contrib)
   })
   
   growing_contrib = reactive({
     
     year = 0:input$years
     amount = input$initial
     rate = input$return * 0.01
     contrib = input$annual
     growth = input$growth * 0.01
     
     growing_contrib = rep(0, length(year))
     
     for (i in year) {
       GC = future_value(amount = amount, rate = rate, years = i) +
         growing_annuity(contrib = contrib, rate = rate, growth = growth, years = i)
       growing_contrib[i + 1] = GC
     }
     return(growing_contrib)
   })
  
   output$timelines = renderPlot({
     year = 0:input$years
     
     if (input$facet == "No") {
       
       # plot of modalities over time
       plot(year, no_contrib(), type = 'l', 
            xlab = "Years After Investing", ylab = "Balance", main = "Three modes of investing",
            col = "#0000FF",
            xlim=c(0, max(year)), ylim=c(0, max(growing_contrib()) + 100))
       lines(year, fixed_contrib(), col = "#FF0000")
       lines(year, growing_contrib(), col = "#008000")
       legend("topleft", legend = c(
         "No Annual Contribution",
         "Fixed Annual Contribution",
         "Growing Annual Contribution"),
         lty = 1,
         col = c("#0000FF", "#FF0000", "#008000"),
         cex = 0.7)
       
     } else if (input$facet == "Yes") {
      
       years = rep(year, times = 3)
       no_contrib = no_contrib()
       fixed_contrib = fixed_contrib()
       growing_contrib = growing_contrib()
       data = c(no_contrib, fixed_contrib, growing_contrib)
       type = c(rep("No Contribution", times = length(year)), rep("Fixed Contribution", times = length(year)), rep("Growing Contribution", times = length(year)))
       type = factor(type, levels = c("No Contribution", "Fixed Contribution", "Growing Contribution"))
       balances = data.frame(years, data, type)
       
       # plot of modalities over time
       ggplot(balances, aes(x = years)) + 
         geom_line(aes(y = c(data[1:length(year)], rep(NA, times = length(year)*2)))) +
         geom_area(aes(y = c(data[1:length(year)], rep(NA, times = length(year)*2)), fill = "no_contrib")) +
         
         geom_line(aes(y = c(rep(NA, times = length(year)), data[(length(year)+1):(length(year)*2)], rep(NA, times = length(year))))) +
         geom_area(aes(y = c(rep(NA, times = length(year)), data[(length(year)+1):(length(year)*2)], rep(NA, times = length(year))), fill = "fixed_contrib")) +
         
         geom_line(aes(y = c(rep(NA, times = 2*length(year)), data[(2*length(year)+1):(length(years))]))) + 
         geom_area(aes(y = c(rep(NA, times = 2*length(year)), data[(2*length(year)+1):(length(years))]), fill = "growing_contrib")) +
         
         guides(fill=guide_legend(title="Savings Plan")) + 
         facet_wrap(.~ type) +  
         labs(title = "Three modes of investing", x = "year", y = "balance") 
     } 
   })
   
   output$balances = renderPrint({
     year = 0:input$years
     no_contrib = no_contrib()
     fixed_contrib = fixed_contrib()
     growing_contrib = growing_contrib()
     balances = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
     print(balances)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


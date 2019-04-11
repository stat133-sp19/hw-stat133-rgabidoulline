## Functions from warmup 6
## Author: Ruslan Gabidoulline
## Description: contains the savings modality functions from warmup 6

####

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

###



### Private Auxiliary Functions
## Author: Ruslan Gabidoulline
## Description: Return corresponding values from computed summary measures
## Global Inputs: trials, prob

###

## Function aux_mean()
# Computes the mean of the binomial distribution
# Output: value of the mean
aux_mean = function(trials, prob) {
  mean = trials * prob
  return(mean)
}


## Function aux_variance()
# Computes the variance of the binomial distribution
# Output: value of the variance
aux_variance = function(trials, prob) {
  variance = trials * prob * (1 - prob)
  return(variance)
}


## Function aux_mode()
# Computes the mode of the binomial distribution
# Output: value of the mode
aux_mode = function(trials, prob) {
  mode = floor(trials*prob + prob)
  if ((trials*prob + prob) == floor(trials*prob + prob)) {
    return(c(mode-1, mode))
  } else {
    return(mode)
  }
}


## Function aux_skewness()
# Computes the skewness of the binomial distribution
# Output: the value of the skewness
aux_skewness = function(trials, prob) {
  skew = (1 - (2*prob)) / (sqrt(trials * prob * (1 - prob)))
  return(skew)
}


## Function aux_kurtosis()
# Computes the kurtosis of the binomial distribution
# Output: the value of the kurtosis
aux_kurtosis = function(trials, prob) {
  kurt = (1 - 6*prob*(1 - prob)) / (trials * prob * (1 - prob))
  return(kurt)
}



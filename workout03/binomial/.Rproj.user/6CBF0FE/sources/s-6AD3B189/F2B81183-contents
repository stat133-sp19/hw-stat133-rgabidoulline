### Functions of Measures
## Author: Ruslan Gabidoulline

###
# load required functions
source("./R/private-checker-functions.R")
source("./R/private-auxiliary-functions.R")

###

#' @title Binomial Mean
#' @description Computes the mean of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return mean of binomial distribution with given parameters
#' @export
#' @examples
#' # mean of distribution with trials = 10 and prob = 0.3
#' bin_mean(10, 0.3)
bin_mean = function(trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  if (check_prob(prob) == FALSE) {
    stop("invalid prob value")
  }
  mean = aux_mean(trials, prob)
  return(mean)
}


#' @title Binomial Variance
#' @description Computes the variance of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return variance of binomial distribution with given parameters
#' @export
#' @examples
#' # variance of distribution with trials = 10 and prob = 0.3
#' bin_variance(10, 0.3)
bin_variance = function(trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  if (check_prob(prob) == FALSE) {
    stop("invalid prob value")
  }
  var = aux_variance(trials, prob)
  return(var)
}


#' @title Binomial Mode
#' @description Computes the mode of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return mode of binomial distribution with given parameters
#' @export
#' @examples
#' # mode of distribution with trials = 10 and prob = 0.3
#' bin_mode(10, 0.3)
bin_mode = function(trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  if (check_prob(prob) == FALSE) {
    stop("invalid prob value")
  }
  mode = aux_mode(trials, prob)
  return(mode)
}


#' @title Binomial Skewness
#' @description Computes the skewness of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return skewness of binomial distribution with given parameters
#' @export
#' @examples
#' # skewness of distribution with trials = 10 and prob = 0.3
#' bin_skewness(10, 0.3)
bin_skewness = function(trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  if (check_prob(prob) == FALSE) {
    stop("invalid prob value")
  }
  skew = aux_skewness(trials, prob)
  return(skew)
}


#' @title Binomial Kurtosis
#' @description Computes the kurtosis of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return kurtosis of binomial distribution with given parameters
#' @export
#' @examples
#' # kurtosis of distribution with trials = 10 and prob = 0.3
#' bin_kurtosis(10, 0.3)
bin_kurtosis = function(trials, prob) {
  if (check_trials(trials) == FALSE) {
    stop("invalid trials value")
  }
  if (check_prob(prob) == FALSE) {
    stop("invalid prob value")
  }
  kurt = aux_kurtosis(trials, prob)
  return(kurt)
}


### Private Checker Functions
## Author: Ruslan Gabidoulline
## Description: These private auxiliary functions test the validity of inputs

###

## Function check_prob()
# Checks if and input prob is a valid probability value
# Inputs: prob
# Output: TRUE if probability is valid, error if probability is invalid
check_prob = function(prob) {
  if (length(prob) != 1) {
    stop("prob must have length 1")
  }
  if (is.numeric(prob) == FALSE) {
    stop("prob must be a number")
  } else if (0 <= prob & prob <= 1) {
    return(TRUE)
  } else {
    stop("prob has to be a number between 0 and 1")
  }
}


## Function check_trials()
# Checks if an input trials is a valid number of trials value
# Inputs: trials
# Output: TRUE if trials is valid, error if trials is invalid
check_trials = function(trials) {
  if (length(trials) != 1) {
    stop("trials must have length 1")
  }
  if (is.numeric(trials) == FALSE) {
    stop("trials must be a number")
  }
  if (floor(trials) != trials) {
    stop("trials must be an integer")
  } else if (0 <= trials) {
    return(TRUE)
  } else {
    stop("trials cannot be negative")
  }
}


## Function check_success()
# Checks if an input success is a valid number of successes value
# Inputs: successes, trials
# Outputs: TRUE if success is valid, error if success is invalid
check_success = function(success, trials) {
  for (i in 1:length(success)) {
    if (is.numeric(success[i]) == FALSE) {
      stop("success must be a number")
    } else if (success[i] < 0) {
      stop("success cannot be negative")
    } else if (success[i] > trials) {
      stop("success cannot be greater than trials")
    } else if (floor(success[i]) != success[i]) {
      stop("success must be an integer")
    }
  }
  return(TRUE)
}



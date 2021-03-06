% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions-of-measures.R
\name{bin_kurtosis}
\alias{bin_kurtosis}
\title{Binomial Kurtosis}
\usage{
bin_kurtosis(trials, prob)
}
\arguments{
\item{trials}{number of trials}

\item{prob}{probability of success}
}
\value{
kurtosis of binomial distribution with given parameters
}
\description{
Computes the kurtosis of a binomial distribution
}
\examples{
# kurtosis of distribution with trials = 10 and prob = 0.3
bin_kurtosis(10, 0.3)
}

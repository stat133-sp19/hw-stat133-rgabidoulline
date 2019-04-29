context("Summary Function Arguments")

test_that("aux_mean works with valid values of trials and prob", {

  trials = 10
  prob = 0.7
  expect_gte(aux_mean(trials, prob), 0)
  expect_equal(aux_mean(trials, prob), (trials * prob))
  expect_length(aux_mean(trials, prob), 1)
  expect_is(aux_mean(trials, prob), "numeric")
})

test_that("aux_mean fails with invalid values of trials and prob", {

  expect_error(aux_mean("a", .5))
  expect_error(aux_mean(5, "a"))
})

test_that("aux_variance works with valid values of trials and prob", {

  trials = 10
  prob = 0.7
  expect_gte(aux_variance(trials, prob), 0)
  expect_equal(aux_variance(trials, prob), (trials * prob * (1 - prob)))
  expect_length(aux_variance(trials, prob), 1)
  expect_is(aux_variance(trials, prob), "numeric")
})

test_that("aux_variance fails with invalid values of trials and prob", {

  expect_error(aux_variance("a", .5))
  expect_error(aux_variance(5, "a"))
})

test_that("aux_mode works with valid values of trials and prob", {

  trials = 10
  prob = 0.5
  expect_gte(aux_mode(trials, prob), 0)
  expect_equal(aux_mode(trials, prob), (floor(trials*prob + prob)))
  expect_length(aux_mode(trials, prob), 1)
  expect_is(aux_mode(trials, prob), "numeric")

  trials = 11
  prob = 0.5
  for (i in 1:2) {
    expect_gte(aux_mode(trials, prob)[i], 0)
  }
  expect_equal(aux_mode(trials, prob), c(((floor(trials*prob + prob)) - 1), (floor(trials*prob + prob))))
  expect_length(aux_mode(trials, prob), 2)
  expect_is(aux_mode(trials, prob), "numeric")
})

test_that("aux_mode fails with invalid values of trials and prob", {

  expect_error(aux_mode("a", .5))
  expect_error(aux_mode(5, "a"))
})

test_that("aux_skewness works with valid values of trials and prob", {

  trials = 10
  prob = 0.7
  expect_equal(aux_skewness(trials, prob), ((1 - (2*prob)) / (sqrt(trials * prob * (1 - prob)))))
  expect_length(aux_skewness(trials, prob), 1)
  expect_is(aux_skewness(trials, prob), "numeric")
})

test_that("aux_skewness fails with invalid values of trials and prob", {

  expect_error(aux_skewness("a", .5))
  expect_error(aux_skewness(5, "a"))
})

test_that("aux_kurtosis works with valid values of trials and prob", {

  trials = 10
  prob = 0.7
  expect_equal(aux_kurtosis(trials, prob), ((1 - 6*prob*(1 - prob)) / (trials * prob * (1 - prob))))
  expect_length(aux_kurtosis(trials, prob), 1)
  expect_is(aux_kurtosis(trials, prob), "numeric")
})

test_that("aux_kurtosis fails with invalid values of trials and prob", {

  expect_error(aux_kurtosis("a", .5))
  expect_error(aux_kurtosis(5, "a"))
})


context("Binomial Functions Arguments")

test_that("bin_choose works with valid values of n and k", {

  n = 8
  k = 2
  expect_equal(bin_choose(n, k), choose(n, k))
  expect_length(bin_choose(n, k), 1)
  expect_is(bin_choose(n, k), "numeric")
})

test_that("bin_choose fails with invalid values of n and k", {

  n = 8
  k = 10
  expect_error(bin_choose(n, k), "k cannot be greater than n")
})

test_that("bin_probability works with valid values of success, trials, and prob", {

  success = 2
  trials = 5
  prob = 0.5
  expect_equal(bin_probability(success, trials, prob), dbinom(success, trials, prob))
  expect_gte(bin_probability(success, trials, prob), 0)
  expect_lte(bin_probability(success, trials, prob), 1)
  expect_length(bin_probability(success, trials, prob), 1)
  expect_is(bin_probability(success, trials, prob), "numeric")

  success = 0:2
  trials = 5
  prob = 0.5
  expect_equal(bin_probability(success, trials, prob), dbinom(success, trials, prob))
  for (i in 1:length(success)) {
    expect_gte(bin_probability(success, trials, prob)[i], 0)
    expect_lte(bin_probability(success, trials, prob)[i], 1)
    expect_is(bin_probability(success, trials, prob)[i], "numeric")
  }
  expect_length(bin_probability(success, trials, prob), length(success))
})

test_that("bin_probability fails with invalid values of success, trials, and prob", {

  expect_error(bin_probability(1, 5, -1), "prob has to be a number between 0 and 1")
  expect_error(bin_probability(1, 5, 2), "prob has to be a number between 0 and 1")
  expect_error(bin_probability(1, 5, "a"), "prob must be a number")
  expect_error(bin_probability(1, 5, 1:100), "prob must have length 1")
  expect_error(bin_probability(1, -5, 0.5), "trials cannot be negative")
  expect_error(bin_probability(1, "a", 0.5), "trials must be a number")
  expect_error(bin_probability(1, 1:100, 0.5), "trials must have length 1")
  expect_error(bin_probability(1, 1.2, 0.5), "trials must be an integer")
  expect_error(bin_probability(-1, 5, 0.5), "success cannot be negative")
  expect_error(bin_probability(-1:4, 5, 0.5), "success cannot be negative")
  expect_error(bin_probability("a", 3, 0.5), "success must be a number")
  expect_error(bin_probability(5, 4, 0.5), "success cannot be greater than trials")
  expect_error(bin_probability(1:5, 4, 0.5), "success cannot be greater than trials")
  expect_error(bin_probability(1.2, 5, 0.5), "success must be an integer")
  expect_error(bin_probability(c(1, 1.2, 3), 5, 0.5), "success must be an integer")
})

test_that("bin_distribution works with valid values of trials and prob", {

  trials = 5
  prob = 0.5
  expect_equal(bin_distribution(trials, prob)$success, (0:trials))
  expect_equal(bin_distribution(trials, prob)$probability, (dbinom(0:trials, trials, prob)))
  for (i in 1:(trials+1)) {
    expect_gte(bin_distribution(trials, prob)$probability[i], 0)
    expect_lte(bin_distribution(trials, prob)$probability[i], 1)
  }
  expect_length(bin_distribution(trials, prob)$success, (trials + 1))
  expect_length(bin_distribution(trials, prob)$probability, (trials + 1))
  expect_is(bin_distribution(trials, prob), c("bindis", "data.frame"))
})

test_that("bin_distribution fails with invalid values of trials and prob", {

  expect_error(bin_distribution(5, -1), "prob has to be a number between 0 and 1")
  expect_error(bin_distribution(5, 2), "prob has to be a number between 0 and 1")
  expect_error(bin_distribution(5, "a"), "prob must be a number")
  expect_error(bin_distribution(5, 1:100), "prob must have length 1")
  expect_error(bin_distribution(-5, 0.5), "trials cannot be negative")
  expect_error(bin_distribution("a", 0.5), "trials must be a number")
  expect_error(bin_distribution(1:100, 0.5), "trials must have length 1")
  expect_error(bin_distribution(1.2, 0.5), "trials must be an integer")
})

test_that("bin_cumulative works with valid values of trials and prob", {

  trials = 5
  prob = 0.5
  expect_equal(bin_cumulative(trials, prob)$success, (0:trials))
  expect_equal(bin_cumulative(trials, prob)$probability, (dbinom(0:trials, trials, prob)))
  expect_equal(bin_cumulative(trials, prob)$cumulative, (pbinom(0:trials, trials, prob)))
  for (i in 1:(trials+1)) {
    expect_gte(bin_cumulative(trials, prob)$probability[i], 0)
    expect_lte(bin_cumulative(trials, prob)$probability[i], 1)
    expect_gte(bin_cumulative(trials, prob)$cumulative[i], 0)
    expect_lte(bin_cumulative(trials, prob)$cumulative[i], 1)
  }
  expect_length(bin_cumulative(trials, prob)$success, (trials + 1))
  expect_length(bin_cumulative(trials, prob)$probability, (trials + 1))
  expect_length(bin_cumulative(trials, prob)$cumulative, (trials + 1))
  expect_is(bin_distribution(trials, prob), c("bincum", "data.frame"))
})

test_that("bin_cumulative fails with invalid values of trials and prob", {
  expect_error(bin_cumulative(5, -1), "prob has to be a number between 0 and 1")
  expect_error(bin_cumulative(5, 2), "prob has to be a number between 0 and 1")
  expect_error(bin_cumulative(5, "a"), "prob must be a number")
  expect_error(bin_cumulative(5, 1:100), "prob must have length 1")
  expect_error(bin_cumulative(-5, 0.5), "trials cannot be negative")
  expect_error(bin_cumulative("a", 0.5), "trials must be a number")
  expect_error(bin_cumulative(1:100, 0.5), "trials must have length 1")
  expect_error(bin_cumulative(1.2, 0.5), "trials must be an integer")
})


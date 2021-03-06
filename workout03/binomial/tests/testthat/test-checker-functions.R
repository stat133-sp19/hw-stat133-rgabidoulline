context("Checker Function Arguments")

test_that("prob is a valid value", {

  prob = 0.5
  expect_is(prob, "numeric")
  expect_length(prob, 1)
  expect_lte(prob, 1)
  expect_gte(prob, 0)
})

test_that("check_prob works with valid prob", {

  expect_true(check_prob(0.5))
})

test_that("check_prob fails with invalid prob", {

  expect_error(check_prob(-1), "prob has to be a number between 0 and 1")
  expect_error(check_prob(2), "prob has to be a number between 0 and 1")
  expect_error(check_prob("a"), "prob must be a number")
  expect_error(check_prob(1:100), "prob must have length 1")
})

test_that("trials is a valid value", {

  trials = 10
  expect_is(trials, "numeric")
  expect_length(trials, 1)
  expect_gte(trials, 0)
  expect_true(floor(trials) == trials)
})

test_that("check_trials works with valid trials", {

  expect_true(check_trials(2))
})

test_that("check_trials fails with invalid trials", {

  expect_error(check_trials(-1), "trials cannot be negative")
  expect_error(check_trials("a"), "trials must be a number")
  expect_error(check_trials(1:100), "trials must have length 1")
  expect_error(check_trials(1.2), "trials must be an integer")
})

test_that("success is a valid value", {

  trials = 10
  success = 0:5
  for (i in 1:length(success)) {
    expect_is(success[i], "integer")
    expect_gte(success[i], 0)
    expect_lte(success[i], trials)
    expect_true(floor(success[i]) == success[i])
  }
  success = 5
  expect_is(success, "numeric")
  expect_gte(success, 0)
  expect_lte(success, trials)
  expect_true(floor(success) == success)
})

test_that("check_success works with valid success", {

  expect_true(check_success(2, 5))
  expect_true(check_success(1:4, 5))
})

test_that("check success fails with invalid success", {
  expect_error(check_success(-1, 5), "success cannot be negative")
  expect_error(check_success(-1:4, 5), "success cannot be negative")
  expect_error(check_success("a", 3), "success must be a number")
  expect_error(check_success(5, 4), "success cannot be greater than trials")
  expect_error(check_success(1:5,4), "success cannot be greater than trials")
  expect_error(check_success(1.2, 5), "success must be an integer")
  expect_error(check_success(c(1, 1.2, 3), 5), "success must be an integer")
})


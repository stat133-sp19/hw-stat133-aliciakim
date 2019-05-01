
context("Testing bin_variable")

test_that("bin_variable handles exceptions",{


  #testing bin_variable handles exceptions

  expect_error(bin_variable(trials=3.5, prob = 0.1))
  expect_error(bin_variable(trials = 5, prob = -0.5))
  expect_error(bin_variable(trials = c(1,2), prob = 0.9))
})

test_that("bin_variable has class binvar, as expected",{

  bin1 <- bin_variable(trials = 10, prob = 0.3)
  expect_s3_class(bin1, "binvar")
  bin1

})


test_that("bin_variable summary works as expected",{

  bin1 <- bin_variable(trials = 10, prob = 0.3)
  binsum1 <- summary(bin1)
  expect_s3_class(binsum1, "summary.binvar")
  binsum1

})


context("Testing bin_variable measures")

test_that("Measures error as expected", {
  expect_error(bin_mean(c(1,3,5), 0.4))
  expect_error(bin_variance(3, -0.4))
  expect_error(bin_mode(0.1, 0.5))
  expect_error(bin_skewness(1, -0.5))
  expect_error(bin_kurtosis(5, c(0.4, 0.5)))

})

test_that("Measures compute numbers as expected", {
  expect_equal(bin_mean(10, 0.3), 3)
  expect_equal(bin_variance(10, 0.3), 2.1)
  expect_equal(bin_mode(10, 0.3), 3)
  expect_equal(bin_skewness(10, 0.3), 0.2760262, tolerance=.002)
  expect_equal(bin_kurtosis(10, 0.3), -0.1238095, tolerance=.002)
  expect_equal(bin_mode(0, 0), 0)
})


library("statfitools")

context("extract")

test_that("extract_code returns numeric",{
  expect_equal(extract_code("508 Mantta-Vilppula"), 508)
})

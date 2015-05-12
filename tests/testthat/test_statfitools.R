library("statfitools")

context("extract")

test_that("extract_code returns numeric",{
  expect_equal(extract_code("508 Mantta-Vilppula"), 508)
})

test_that("extract_name returns name",{
  expect_equal(extract_name("508 Mantta-Vilppula"), "Mantta-Vilppula")
  expect_equal(extract_name("S1311 Valtionhallinto ee"), "Valtionhallinto ee")
  expect_equal(extract_name("G01  Yleinen julkishallinto"), "Yleinen julkishallinto")
})


context("get_class")


test_that("get_class functions return data.frame",{
  expect_is(sf_get_class_key("kuntaryhmitys", 2014), "data.frame")
  expect_is(sf_get_reg_key("maakunta", 2014), "data.frame")
  expect_is(sf_get_class("maakunta", 2013), "data.frame")
})

library("statfitools")

context("extract")

test_that("extract_code returns numeric",{
  expect_equal(extract_code("508 Mantta-Vilppula"), 508)
  expect_equal(extract_code("B1GMHT/HI00 Bruttokansantuote, hintaindeksi 2010=100"),
               "B1GMHT/HI00")
  expect_equal(extract_code("G01  Yleinen julkishallinto"), "G01")
  expect_is(extract_code(factor("G01  Yleinen julkishallinto")), "factor")
})

test_that("extract_name returns name",{
  expect_equal(extract_name("508 Mantta-Vilppula"), "Mantta-Vilppula")
  expect_equal(extract_name("S1311 Valtionhallinto ee"), "Valtionhallinto ee")
  expect_equal(extract_name("Valtionhallinto"), "Valtionhallinto")
  expect_equal(extract_name("G01  Yleinen julkishallinto"), "Yleinen julkishallinto")
  expect_equal(extract_name("B1GMHT/HI00 Bruttokansantuote, hintaindeksi 2010=100"),
               "Bruttokansantuote, hintaindeksi 2010=100")
  expect_is(extract_name(factor("Valtionhallinto")), "factor")
})


context("get_class")


test_that("get_class functions return data.frame",{
  expect_is(sf_get_class_key("kuntaryhmitys", 2014), "data.frame")
  expect_is(sf_get_reg_key("maakunta", 2014), "data.frame")
  expect_is(sf_get_class("maakunta", 2013), "data.frame")
})

context("clean")

test_that("clean_times return right",{
  expect_is(clean_times(output_ind, time_format = "date")$time, "Date")
})

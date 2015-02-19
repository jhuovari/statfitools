<!-- README.md is generated from README.Rmd. Please edit that file -->
statfitools
===========

The `statfitools` is a collection of functions to help working with a data from [Statistics Finland](http://tilastokeskus.fi). I have writen functions for my own use, but I am happy if someone else finds functions useful. Some of the functions are spesific to the data from Statistics Finland, others have more general use.

To download the data from the Statistics Finland use [pxweb](https://github.com/rOpenGov/pxweb).

Installation
------------

To install the package:

``` r
install.packages("devtools")
devtools::install_github("jhuovari/statfitools")
```

Usage
-----

``` r
library("statfitools")
```

### Preprocess data

#### Make legal names

Try to make more readable names than `make.names()`

-   `make_names()` to pass a strings.
-   `clean_names()` to pass a data.frame or other objects with names to change.

``` r

# install.packages("pxweb")

dat <- pxweb::get_pxweb_data(
  url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/vrm/tyokay/010_tyokay_tau_101.px",
  dims = list(
    Alue = c('SSS'),
    "Pääasiallinen toiminta" = c('*'),
    Sukupuoli = c('S'),
    Ikä = c('SSS'),
    Vuosi = c('*')),
  clean = TRUE)

names(dat)
#> [1] "Alue"                   "Pääasiallinen toiminta"
#> [3] "Vuosi"                  "Ikä"                   
#> [5] "Sukupuoli"              "values"

dat <- clean_names(dat)

names(dat)
#> [1] "Alue"                   "Paaasiallinen_toiminta"
#> [3] "Vuosi"                  "Ika"                   
#> [5] "Sukupuoli"              "values"
```

#### Extract code from a string

``` r

extract_code("508 Mantta-Vilppula")
#> [1] 508
```

### Work with classifications

-   `sf_get_class()` to download statistical classifications from the Statistics Finland.
-   `sf_test_class()` to test statistical classifications from the Statistics Finland.
-   `sf_recode()`, `sf_name2code()` and `sf_code2name()` for recoding classifications

### Work with a statfi regional data

#### Clean regional names

Statistics Finland uses different formats to present regional names. Make them uniform.

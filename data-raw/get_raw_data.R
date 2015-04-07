

public_debt <- pxweb::get_pxweb_data(url = "http://pxnet2.stat.fi/PXWeb/api/v1/fi/StatFin/jul/jali/010_jali_tau_101.px",
                                    dims = list("Alijäämä/velka" = c('*'),
                                                Sektori = c('*'),
                                                Arvo = c('*'),
                                                Vuosi = c('*')),
                                    clean = TRUE)

devtools::use_data(public_debt, overwrite = TRUE)

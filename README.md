
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CIGM

<!-- badges: start -->
<!-- badges: end -->

The package provides functions for recovering finite resolution
approximations of conditional independence graphs of Gaussian processes.

## Installation

You can install the development version of CIGM from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kgwstat/CIGM")
```

## Example

This is a basic example which considers the Brownian motion covariance:

``` r
library(CIGM)
## Brownian motion example
Range <- seq(0, 1, length.out = 300)
CovFn <- function(x, y) {min(x, y)}
M <- outer(Range, Range, Vectorize(CovFn))
P <- PrecisionOpMatrix(M, 20)
```

Here is the plot:

    #> Warning: package 'viridisLite' was built under R version 4.2.3

<img src="man/figures/README-pressure-1.png" width="100%" />

#' Partition \code{1:n} into \code{p} contiguous subvectors of roughly equal length.
#'
#' @param n An integer.
#' @param p An integer.
#'
#' @return A list of vectors.
#'
#' @examples
#' Partition(10, 3)
#'
#' @export
Partition <- function(n, p) {
  q <- floor(n / p)
  r <- n %% p

  start <- 1
  partition <- list()
  for (i in 1:p) {
    size <- q + as.integer(i <= r)
    partition[[i]] <- start:(start + size - 1)
    start <- start + size
  }

  return(partition)
}

#' Calculates the precision operator matrix of a covariance matrix \code{M} with respect to the partition \code{partition}.
#'
#' @param M A matrix.
#' @param partition An integer or a partition (see \code{\link{Partition}}).
#' @param epsilon The regularization parameter. By default \code{epsilon == 1e-15}. See \code{\link{CorrelationOpMatrix}}
#' @param type A string equal to \code{"norms"} or \code{"matrices"}. By default \code{type == "norms"}.
#'
#' @return A matrix representing the precision operator matrix  if \code{type == "matrices"} or a matrix of the operator norms of constituent operators if \code{type == "norms"}.
#' @export
#'
#' @examples
#' PrecisionOpMatrix(matrix(1, 10, 10), 3, 1e-10, "norms")
#' PrecisionOpMatrix(matrix(1, 10, 10), Partition(10, 3), 1e-10, "norms")
#' @seealso
#' [CorrelationOpMatrix()]
#' [OpNormMatrix()]
#'
PrecisionOpMatrix <- function(M, partition, epsilon = 1e-15, type = "norms") {
  n <- nrow(M)
  if (is.numeric(partition) && partition > 0 && partition %% 1 == 0) {
    partition <- Partition(n, partition)
  }

  R0 <- CorrelationOpMatrix(M, partition, epsilon, type = "matrices") - diag(n)
  P <- diag(n) - solve(diag(n) + R0 / n, R0) / n
  P <- (P + t(P)) / 2

  switch(type,
    norms = OpNormMatrix(P, partition),
    matrices = P
  )
}

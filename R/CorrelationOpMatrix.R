#' Calculates the correlation operator matrix of a covariance matrix \code{M} with respect to the partition \code{partition}.
#'
#' @param M A matrix.
#' @param partition An integer or a partition (see \code{\link{Partition}}).
#' @param epsilon The regularization parameter. By default \code{epsilon == 1e-15}.
#' @param type A string equal to \code{"norms"} or \code{"matrices"}. By default \code{type == "norms"}.
#'
#' @return A matrix representing the correlation operator matrix  if \code{type == "matrices"} or a matrix of the operator norms of constituent operators if \code{type == "norms"}.
#' @export
#'
#' @examples
#' CorrelationOpMatrix(matrix(1, 10, 10), 3, 1e-10, "norms")
#' CorrelationOpMatrix(matrix(1, 10, 10), Partition(10, 3), 1e-10, "norms")
#' @seealso
#' [PrecisionOpMatrix()]
#' [OpNormMatrix()]
CorrelationOpMatrix <- function(M, partition, epsilon = 1e-15, type = "norms") {
  n <- nrow(M)
  if (is.numeric(partition) && partition > 0 && partition %% 1 == 0) {
    partition <- Partition(n, partition)
  }

  EigenDecomposition <- eigen(DiagonalPart(M, partition) / n)
  Eigenvalues <- EigenDecomposition$values
  Eigenvalues <- epsilon + (Eigenvalues + abs(Eigenvalues)) / 2

  D <- diag(x = Eigenvalues^{
    1 / 2
  })
  V <- EigenDecomposition$vectors
  B <- V %*% D %*% t(V)
  C <- t(solve(B, t(solve(B, M - DiagonalPart(M, partition)))))
  R <- diag(n) + (C + t(C)) / 2

  switch(type,
    norms = OpNormMatrix(R, partition),
    matrices = R
  )
}

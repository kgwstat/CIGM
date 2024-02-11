#' Calculates the matrix of operator norms of a matrix \code{M} with respect to the partition \code{partition}.
#'
#' @param M A matrix.
#' @param partition An integer or a partition (see \code{\link{Partition}}).
#'
#' @examples
#' OpNormMatrix(matrix(1, 10, 10), list(1:4, 5:7, 8:10))
#' OpNormMatrix(matrix(1, 10, 10), Partition(10, 3))
#' OpNormMatrix(matrix(1, 10, 10), 3)
#'
#' @return A matrix.
#' @export
#'
OpNormMatrix <- function(M, partition) {
  n <- nrow(M)
  if (is.numeric(partition) && partition %% 1 == 0 && partition > 0) {
    partition <- Partition(n, partition)
  }

  p <- length(partition)
  OpNormMat <- matrix(0, p, p)
  for (i in 1:p) {
    for (j in i:p) {
      OpNormMat[i, j] <- norm(M[partition[[i]], partition[[j]]], type = "2")
      OpNormMat[j, i] <- OpNormMat[i, j]
    }
  }
  return(OpNormMat / n)
}

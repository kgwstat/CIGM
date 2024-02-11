#' Returns the block diagonal part of a matrix \code{M} with respect to the partition \code{partition}.
#'
#' @param M A matrix.
#' @param partition An integer or a partition (see \code{\link{Partition}}).
#'
#' @return A matrix.
#'
#' @examples
#' DiagonalPart(matrix(1, 10, 10), list(1:4, 5:7, 8:10))
#' DiagonalPart(matrix(1, 10, 10), Partition(10, 3))
#' DiagonalPart(matrix(1, 10, 10), 3)
#'
#' @export
#'
DiagonalPart <- function(M, partition) {
  n <- nrow(M)
  if (is.numeric(partition) && partition %% 1 == 0 && partition > 0) {
    partition <- Partition(n, partition)
  }

  PartitionOnes <- matrix(0, n, n)
  for (ix in partition) {
    PartitionOnes[ix, ix] <- 1
  }
  return(PartitionOnes * M)
}

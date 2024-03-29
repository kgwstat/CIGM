% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OpNormMatrix.R
\name{OpNormMatrix}
\alias{OpNormMatrix}
\title{Calculates the matrix of operator norms of a matrix \code{M} with respect to the partition \code{partition}.}
\usage{
OpNormMatrix(M, partition)
}
\arguments{
\item{M}{A matrix.}

\item{partition}{An integer or a partition (see \code{\link{Partition}}).}
}
\value{
A matrix.
}
\description{
Calculates the matrix of operator norms of a matrix \code{M} with respect to the partition \code{partition}.
}
\examples{
OpNormMatrix(matrix(1, 10, 10), list(1:4, 5:7, 8:10))
OpNormMatrix(matrix(1, 10, 10), Partition(10, 3))
OpNormMatrix(matrix(1, 10, 10), 3)

}

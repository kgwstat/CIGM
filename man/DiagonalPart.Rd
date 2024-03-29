% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DiagonalPart.R
\name{DiagonalPart}
\alias{DiagonalPart}
\title{Returns the block diagonal part of a matrix \code{M} with respect to the partition \code{partition}.}
\usage{
DiagonalPart(M, partition)
}
\arguments{
\item{M}{A matrix.}

\item{partition}{An integer or a partition (see \code{\link{Partition}}).}
}
\value{
A matrix.
}
\description{
Returns the block diagonal part of a matrix \code{M} with respect to the partition \code{partition}.
}
\examples{
DiagonalPart(matrix(1, 10, 10), list(1:4, 5:7, 8:10))
DiagonalPart(matrix(1, 10, 10), Partition(10, 3))
DiagonalPart(matrix(1, 10, 10), 3)

}

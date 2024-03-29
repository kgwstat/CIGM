% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PrecisionOpMatrix.R
\name{PrecisionOpMatrix}
\alias{PrecisionOpMatrix}
\title{Calculates the precision operator matrix of a covariance matrix \code{M} with respect to the partition \code{partition}.}
\usage{
PrecisionOpMatrix(M, partition, epsilon = 1e-15, type = "norms")
}
\arguments{
\item{M}{A matrix.}

\item{partition}{An integer or a partition (see \code{\link{Partition}}).}

\item{epsilon}{The regularization parameter. By default \code{epsilon == 1e-15}. See \code{\link{CorrelationOpMatrix}}}

\item{type}{A string equal to \code{"norms"} or \code{"matrices"}. By default \code{type == "norms"}.}
}
\value{
A matrix representing the precision operator matrix  if \code{type == "matrices"} or a matrix of the operator norms of constituent operators if \code{type == "norms"}.
}
\description{
Calculates the precision operator matrix of a covariance matrix \code{M} with respect to the partition \code{partition}.
}
\examples{
PrecisionOpMatrix(matrix(1, 10, 10), 3, 1e-10, "norms")
PrecisionOpMatrix(matrix(1, 10, 10), Partition(10, 3), 1e-10, "norms")
}
\seealso{
\code{\link[=CorrelationOpMatrix]{CorrelationOpMatrix()}}
\code{\link[=OpNormMatrix]{OpNormMatrix()}}
}

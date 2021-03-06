% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/forward.search.R
\name{forward.search}
\alias{forward.search}
\alias{plot.forward.search}
\alias{print.forward.search}
\title{Forward search algorithm for outlier detection}
\usage{
forward.search(data, model, criteria = c("GOF", "mah"), n.subsets = 1000,
  p.base = 0.4, print.messages = TRUE, ...)

\method{print}{forward.search}(x, ncases = 10, stat = "GOF", ...)

\method{plot}{forward.search}(x, y = NULL, stat = "GOF",
  main = "Forward Search", type = c("p", "h"), ylab = "obs.resid", ...)
}
\arguments{
\item{data}{matrix or data.frame}

\item{model}{if a single numeric number declares number of factors to extract in
exploratory factor analysis. If \code{class(model)} is a sem (semmod), or lavaan (character),
then a confirmatory approach is performed instead}

\item{criteria}{character strings indicating the forward search method
Can contain \code{'GOF'} for goodness of fit distance, \code{'mah'} for Mahalanobis
distance, or \code{'res'} for model implied residuals}

\item{n.subsets}{a scalar indicating how many samples to draw to find
a homogeneous starting base group}

\item{p.base}{proportion of sample size to use as the base group}

\item{print.messages}{logical; print how many iterations are remaining?}

\item{...}{additional parameters to be passed}

\item{x}{an object of class \code{forward.search}}

\item{ncases}{number of final cases to print in the sequence}

\item{stat}{type of statistic to use. Could be 'GOF', 'RMR', or 'gCD' for
the model chi squared value, root mean square residual, or generalized Cook's distance,
respectively}

\item{y}{a \code{null} value ignored by \code{plot}}

\item{main}{the main title of the plot}

\item{type}{type of plot to use, default displays points and lines}

\item{ylab}{the y label of the plot}
}
\description{
The forward search algorithm begins by selecting a homogeneous subset
of cases based on a maximum likelihood criteria and continues to add individual
cases at each iteration given an acceptance criteria. By default the function
will add cases that contribute most to the likelihood function and that have
the closest robust Mahalanobis distance, however model implied residuals
may be included as well.
}
\details{
Note that \code{forward.search} is not limited to confirmatory factor analysis and
can apply to nearly any model being studied
where detection of influential observations is important.
}
\examples{
\dontrun{

#run all internal gCD and GOF functions using multiple cores
setCluster()

#Exploratory
nfact <- 3
(FS <- forward.search(holzinger, nfact))
(FS.outlier <- forward.search(holzinger.outlier, nfact))
plot(FS)
plot(FS.outlier)

#Confirmatory with sem
model <- sem::specifyModel()
	  F1 -> Remndrs,    lam11
	  F1 -> SntComp,    lam21
	  F1 -> WrdMean,    lam31
	  F2 -> MissNum,    lam41
	  F2 -> MxdArit,    lam52
	  F2 -> OddWrds,    lam62
	  F3 -> Boots,      lam73
	  F3 -> Gloves,     lam83
	  F3 -> Hatchts,    lam93
	  F1 <-> F1,   NA,     1
	  F2 <-> F2,   NA,     1
	  F3 <-> F3,   NA,     1


(FS <- forward.search(holzinger, model))
(FS.outlier <- forward.search(holzinger.outlier, model))
plot(FS)
plot(FS.outlier)

#Confirmatory with lavaan
model <- 'F1 =~  Remndrs + SntComp + WrdMean
F2 =~ MissNum + MxdArit + OddWrds
F3 =~ Boots + Gloves + Hatchts'

(FS <- forward.search(holzinger, model))
(FS.outlier <- forward.search(holzinger.outlier, model))
plot(FS)
plot(FS.outlier)


}
}
\author{
Phil Chalmers \email{rphilip.chalmers@gmail.com}
}
\seealso{
\code{\link{gCD}}, \code{\link{GOF}}, \code{\link{LD}},
  \code{\link{robustMD}}, \code{\link{setCluster}}
}
\keyword{forward.search}


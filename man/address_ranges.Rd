% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transportation.R
\name{address_ranges}
\alias{address_ranges}
\title{Download an address range features shapefile into R}
\usage{
address_ranges(state, county, year = NULL, ...)
}
\arguments{
\item{state}{The two-digit FIPS code of the state of the county you'd like
to download the roads for. Can also be state name or abbreviation
(case-insensitive).}

\item{county}{The three-digit FIPS code of the county you'd like the roads for.
Can also be a county name.}

\item{year}{the data year (defaults to 2019).}

\item{...}{arguments to be passed to the underlying `load_tiger` function, which is not exported.
Options include \code{class}, which can be set to \code{"sp"} (the default) or \code{"sf"} to
request sp or sf class objects, and \code{refresh}, which specifies whether or
not to re-download shapefiles (defaults to \code{FALSE}).}
}
\description{
Download an address range features shapefile into R
}
\seealso{
\url{https://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2019/TGRSHP2019_TechDoc.pdf}

Other transportation functions: 
\code{\link{primary_roads}()},
\code{\link{primary_secondary_roads}()},
\code{\link{rails}()},
\code{\link{roads}()}
}
\concept{transportation functions}

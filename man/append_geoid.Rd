% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geocode.R
\name{append_geoid}
\alias{append_geoid}
\title{Retrieve GEOID from the Census Geocoder by address}
\usage{
append_geoid(address, geoid_type = "block")
}
\arguments{
\item{address}{A tibble/data frame with (at a minimum, others can be present)
either character columns street, city, and state OR numeric columns lat and
lon. Lat/lon columns take priority.}

\item{geoid_type}{GEOID level to return, \code{c('county', 'tract', 'block group', 'block')}.
Defaults to block.}
}
\value{
the original tibble with GEOIDs appended as a new column called
\code{geoid}.
}
\description{
Returns GEOID for 2020 geographies.
}
\examples{
\dontrun{
airports <- dplyr::data_frame(
  street = "700 Catalina Dr", city = "Daytona Beach", state = "FL"
)
append_geoid(airports, 'tract')
}
}
\author{
Josie Kressner, \email{josie@transportfoundry.com}
}

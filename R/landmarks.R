#' Download the Military Installation National Shapefile into R
#'
#' Description from the US Census Bureau: "The Census Bureau includes landmarks
#' such as military installations in the MAF/TIGER database for
#' locating special features and to help enumerators during field operations. The Census Bureau adds
#' landmark features to the database on an as-needed basis and does not attempt to ensure that all
#' instances of a particular feature are included. For additional information about area landmarks, please
#' see Section 3.12, Landmarks (Area and Point)."
#'
#' This file does not include the three point landmarks identified as military installation features in the
#' MAF/TIGER database. These point landmarks are included in the point landmark shapefile.
#' Although almost all military installations have assigned 8-character National Standard (GNIS) codes, the
#' Census Bureau has not loaded most of this data into the MAF/TIGER database. The 2020 military
#' shapefiles contain few values in the ANSICODE field.
#' @inheritParams load_tiger_doc_template
#' @inheritSection load_tiger_doc_template Additional Arguments
#' @seealso \url{https://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2020/TGRSHP2020_TechDoc_Ch3.pdf}
#' @export

military <- function(year = NULL, ...) {
    if (is.null(year)) {
        year <- getOption("tigris_year", 2024)

        message(sprintf("Retrieving data for the year %s", year))
    }

    if (year < 2011) {
        fname <- as.character(match.call())[[1]]

        msg <- sprintf(
            "%s is not currently available for years prior to 2011.  To request this feature,
                   file an issue at https://github.com/walkerke/tigris.",
            fname
        )

        stop(msg, call. = FALSE)
    }

    url <- sprintf(
        "https://www2.census.gov/geo/tiger/TIGER%s/MIL/tl_%s_us_mil.zip",
        as.character(year),
        as.character(year)
    )

    return(load_tiger(url, tigris_type = "military", ...))
}


#' Download a point or area landmarks shapefile into R
#'
#' Description from the US Census Bureau:
#' "The Census Bureau includes landmarks in the MAF/TIGER database (MTDB) for locating special features
#' and to help enumerators during field operations. Some of the more common landmark types include area
#' landmarks such as airports, cemeteries, parks, and educational facilities and point landmarks such as
#' schools and churches."
#'
#' The Census Bureau adds landmark features to the database on an as-needed basis and makes no
#' attempt to ensure that all instances of a particular feature were included. The absence of a landmark
#' such as a hospital or prison does not mean that the living quarters associated with that landmark were
#' excluded from the 2010 Census enumeration. The landmarks were not used as the basis for building or
#' maintaining the address list used to conduct the 2010 Census.
#'
#' Area landmark and area water features can overlap; for example, a park or other special land-use feature
#' may include a lake or pond. In this case, the polygon covered by the lake or pond belongs to a water
#' feature and a park landmark feature. Other kinds of landmarks can overlap as well. Area landmarks can
#' contain point landmarks, but these features are not linked in the TIGER/Line Shapefiles.
#'
#' Landmarks may be identified by a MAF/TIGER feature class code only and may not have a name. Each
#' landmark has a unique area landmark identifier (AREAID) or point landmark identifier (POINTID) value.
#'
#' @seealso \url{https://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2020/TGRSHP2020_TechDoc_Ch3.pdf}
#'
#' @param state The state for which you'd like to download the landmarks
#' @param type Whether you would like to download point landmarks (\code{"point"}) or area landmarks (\code{"area"}). #'                Defaults to \code{"point"}.
#' @inheritParams load_tiger_doc_template
#' @inheritSection load_tiger_doc_template Additional Arguments
#' @export
landmarks <- function(state, type = "point", year = NULL, ...) {
    if (is.null(year)) {
        year <- getOption("tigris_year", 2024)

        message(sprintf("Retrieving data for the year %s", year))
    }

    if (year < 2011) {
        fname <- as.character(match.call())[[1]]

        msg <- sprintf(
            "%s is not currently available for years prior to 2011.  To request this feature,
                   file an issue at https://github.com/walkerke/tigris.",
            fname
        )

        stop(msg, call. = FALSE)
    }

    state <- validate_state(state)

    cyear <- as.character(year)

    if (type == "area") {
        url <- sprintf(
            "https://www2.census.gov/geo/tiger/TIGER%s/AREALM/tl_%s_%s_arealm.zip",
            cyear,
            cyear,
            state
        )
        return(load_tiger(url, tigris_type = "area_landmark", ...))
    } else if (type == "point") {
        url <- sprintf(
            "https://www2.census.gov/geo/tiger/TIGER%s/POINTLM/tl_%s_%s_pointlm.zip",
            cyear,
            cyear,
            state
        )
        return(load_tiger(url, tigris_type = "point_landmark", ...))
    } else {
        stop(
            'The argument supplied to type must be either "point" or "area"',
            call. = FALSE
        )
    }
}

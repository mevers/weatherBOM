compass_pts <- seq(0, 337.5, by = 22.5)
names(compass_pts) <- c(
    "N", "NNE", "NE", "ENE",
    "E", "ESE", "SE", "SSE",
    "S", "SSW", "SW", "WSW",
    "W", "WNW", "NW", "NNW")


#' Convert 16-wind compass rose points to angles
#'
#' Convert 16-wind compass rose points to angles
#'
#' @param x A `character` vector of compass points
#'
#' @return A `numeric` vector
#'
#' @examples
#' compass2angle("SSW")
#'
#' @export
#'
compass2angle <- function(x) {

    checkmate::assert_character(x)
    if (all(is.na(x))) x else as.numeric(unname(compass_pts[x]))

}


#' Convert angles to 16-wind compass rose points
#'
#' Convert angles to 16-wind compass rose points
#'
#' @param x A `numeric` vector of angles
#'
#' @return A `character` vector of compass points
#'
#' @examples
#' angle2compass(c(180, 22.5))
#'
#' @export
#'
angle2compass <- function(x) {

    checkmate::assert_numeric(x, any.missing = TRUE)
    names(compass_pts)[match(x, compass_pts)]

}

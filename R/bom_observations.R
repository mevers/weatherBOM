#' Get current weather observations
#'
#' Get current weather observations
#'
#' @param geohash A `character` string giving the location ID, as retrieved
#' from [`bom_search_station`]
#' @param ep A `character` string of the API endpoint; defaults to
#' `weatherBOM:::endpoint`
#'
#' @return A `list`
#'
#' @examples
#' bom_observations("r3dp4vp")
#'
#' @export
bom_observations <- function(geohash, ep = endpoint) {

    # Need modified geohash: strip last character from geohash
    geohash <- stringr::str_sub(geohash, 1, nchar(geohash) - 1)

    # API call
    call <- paste0(ep, "locations/", geohash, "/observations")
    jsonlite::fromJSON(httr::content(
        httr::GET(call),
        as = "text",
        encoding = "UTF-8"))

}

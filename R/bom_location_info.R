#' Get location information based on location ID
#'
#' Get location information based on location ID
#'
#' @param geohash A `character` string giving the location ID, as retrieved
#' from [`bom_search_station`]
#' @param ep A `character` string of the API endpoint; defaults to
#' `weatherBOM:::endpoint`
#'
#' @return A `list`
#'
#' @examples
#' bom_location_info("r3dp4vp")
#'
#' @export
bom_location_info <- function(geohash, ep = endpoint) {

    call <- paste0(ep, "locations/", geohash)
    jsonlite::fromJSON(httr::content(
        httr::GET(call),
        as = "text",
        encoding = "UTF-8"))

}

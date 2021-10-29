#' Search for a weather station based on location name
#'
#' Search for a weather station based on location name
#'
#' @param name A `character` string giving the location name
#' @param raw A `logical` scalar; if `TRUE` returns JSON output as a `list`,
#' otherwise coerces output to a `data.frame`
#' @param ep A `character` string of the API endpoint; defaults to
#' `weatherBOM:::endpoint`
#'
#' @return A `data.frame` or `list`
#'
#' @examples
#' bom_search_station("Canberra")
#'
#' @export
#'
bom_search_station <- function(name, raw = FALSE, ep = endpoint) {

    # Sanity checks
    if (!is.character(name) | length(name) > 1)
        stop("name must be a single character string")
    if (is.na(name)) return(name)

    # API call
    call <- paste0(ep, sprintf("locations?search=%s", name))
    ret <- jsonlite::fromJSON(httr::content(
        httr::GET(call), as = "text", encoding = "UTF-8"))

    if (!raw) ret <- ret$data

    return(ret)

}

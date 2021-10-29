#' Get daily or 3-hourly weather forecasts
#'
#' Get daily or 3-hourly weather forecasts
#'
#' This function retrieves weather forecasts for a specific location ID (the
#' geohash key as retrieved from [`bom_search_station`]). If `freq = "daily"`,
#' forecasts for the next 7 days include maximum/minimum temperatures, chance
#' and amount of rain, UV risk category and sun protection times, and
#' sunrise/sunset times. If `freq = "3-hourly"`, forecasts for the next 2 days
#' include the temperature, chance and amount of rain, and wind speed and
#' direction. **Note that all times are given in local time.**
#'
#'
#'
#' @param geohash A `character` string giving the location ID, as retrieved
#' from [`bom_search_station`]
#' @param freq A `character` string giving the frequency of forecasts;
#' one of `"daily"` or `"3-hourly"`
#' @param raw A `logical` scalar; if `TRUE` returns JSON output as a `list`,
#' otherwise coerces output to a `data.frame`
#' @param ep A `character` string of the API endpoint; defaults to
#' `weatherBOM:::endpoint`
#'
#' @return A `data.frame` or `list`
#'
#' @importFrom magrittr "%>%"
#'
#' @examples
#' bom_forecasts("r3dp4vp")
#'
#' @export
#'
bom_forecasts <- function(geohash,
                          freq = c("daily", "3-hourly"),
                          raw = FALSE,
                          ep = endpoint) {

    # Sanity checks and formatting
    freq <- match.arg(freq, c("daily", "3-hourly"))
    tz <- bom_location_info(geohash)$data$timezone
    if (freq == "3-hourly")
        geohash <- stringr::str_sub(geohash, 1, nchar(geohash) - 1)

    # API call
    call <- paste0(ep, "locations/", geohash, "/forecasts/", freq)
    ret <- jsonlite::fromJSON(httr::content(
        httr::GET(call),
        as = "text",
        encoding = "UTF-8"))

    if (!raw & is.null(ret$errors)) {
        ret <- ret$data %>%
            jsonlite::flatten() %>%
            dplyr::mutate(dplyr::across(
                dplyr::matches("(date|time|forecast_period)"),
                ~ lubridate::with_tz(
                    lubridate::parse_date_time(
                        .x, "%Y-%m-%dT%H:%M:%SZ", exact = TRUE),
                    tzone = tz)))

    }

    return(ret)

}

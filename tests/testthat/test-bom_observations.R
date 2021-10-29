test_that(
    "bom_forecasts() on non-existing name returns list with errors", {
        expect_identical(
            bom_observations("abcdefg")$errors$title, "Invalid Geohash")
    }
)

test_that(
    "bom_forecasts() with empty/NA/NULL endpoint returns error", {
        expect_error(
            bom_observations("r3dp4vp", ep = NULL),
            regexp = "Could not resolve host")
        expect_error(
            bom_observations("r3dp4vp", ep = NA),
            regexp = "Could not resolve host")
        expect_error(
            bom_observations("r3dp4vp", ep = ""),
            regexp = "Could not resolve host")
    }
)

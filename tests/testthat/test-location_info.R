test_that(
    "bom_location_info() on non-existing name returns list with errors", {
        expect_identical(
            bom_location_info("abcdefg")$errors$title, "Invalid Geohash")
    }
)

test_that(
    "bom_location_info() with empty/NA/NULL endpoint returns error", {
        expect_error(
            bom_location_info("r3dp4vp", ep = NULL),
            regexp = "Could not resolve host")
        expect_error(
            bom_location_info("r3dp4vp", ep = NA),
            regexp = "Could not resolve host")
        expect_error(
            bom_location_info("r3dp4vp", ep = ""),
            regexp = "Could not resolve host")
    }
)

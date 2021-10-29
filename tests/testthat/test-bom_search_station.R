test_that(
    "bom_search_station() with NA name returns NA", {
        expect_identical(bom_search_station(NA_character_), NA_character_)
    }
)

test_that(
    "bom_search_station() on non-character/vector returns error", {
        expect_error(
            bom_search_station(1), regexp = "single character string")
        expect_error(
            bom_search_station(c("a", "b")), regexp = "single character string")
    }
)

test_that(
    "bom_search_station() on non-existing name returns empty list", {
        expect_identical(bom_search_station("abcdefg"), list())
    }
)

test_that(
    "bom_search_station() with empty/NA/NULL endpoint returns error", {
        expect_error(
            bom_search_station("Canberra", ep = NULL),
            regexp = "Could not resolve host")
        expect_error(
            bom_search_station("Canberra", ep = NA),
            regexp = "Could not resolve host")
        expect_error(
            bom_search_station("Canberra", ep = ""),
            regexp = "Could not resolve host")
    }
)

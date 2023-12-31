test_that(
    "compass2angle() on NULL returns error", {
        expect_error(compass2angle(NULL), regexp = "character")
    }
)

test_that(
    "compass2angle() on non-character vector returns error", {
        expect_error(compass2angle(1:3), regexp = "character")
    }
)

test_that(
    "compass2angle() on NA (vector) returns NA (vector)", {
        expect_identical(compass2angle(NA), NA)
        expect_identical(compass2angle(c(NA, NA)), c(NA, NA))
    }
)

test_that(
    "compass2angle() on vector containing NA conserves NA", {
        expect_equal(compass2angle(c("N", NA, "S")), c(0, NA_real_, 180))
    }
)

test_that(
    "compass2angle() on non-compass point returns NA", {
        expect_equal(compass2angle("Q"), NA_real_)
        expect_equal(compass2angle(c("Q", "R")), c(NA_real_, NA_real_))
        expect_equal(compass2angle(c("N", "R", "S")), c(0, NA_real_, 180))
    }
)

test_that(
    "angle2compass() on NULL returns error", {
        expect_error(angle2compass(NULL), regexp = "numeric")
    }
)

test_that(
    "angle2compass() on non-numeric vector returns error", {
        expect_error(angle2compass(c("A", "B")), regexp = "numeric")
    }
)

test_that(
    "angle2compass() on all NA (vector) returns NA (vector)", {
        expect_identical(angle2compass(NA), NA_character_)
        expect_identical(angle2compass(
            c(NA, NA)), c(NA_character_, NA_character_))
    }
)

test_that(
    "compass2angle() on vector containing NA conserves NA", {
        expect_equal(
            angle2compass(c(337.5, NA, 22.5)), c("NNW", NA_character_, "NNE"))
    }
)

test_that(
    "angle2compass() on non-compass angle returns NA", {
        expect_equal(
            angle2compass(10), NA_character_)
        expect_equal(
            angle2compass(c(10, 20)), c(NA_character_, NA_character_))
        expect_equal(
            angle2compass(c(67.5, 70, 90)), c("ENE", NA_character_, "E"))
    }
)

test_that(
    "angle2compass(compass2angle(x)) equals x", {
        expect_equal(
            angle2compass(compass2angle(c("NNW", "NNE"))), c("NNW", "NNE"))
        expect_equal(
            angle2compass(compass2angle(c("NNW", NA, "NNE"))),
            c("NNW", NA, "NNE"))
    }
)

test_that(
    "compass2angle(angle2compass(x)) equals x", {
        expect_equal(
            compass2angle(angle2compass(c(67.5, 90))), c(67.5, 90))
        expect_equal(
            compass2angle(angle2compass(c(67.5, NA, 90))), c(67.5, NA, 90))
    }
)


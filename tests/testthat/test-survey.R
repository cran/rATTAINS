test_that("survey returns expected types and classes", {

  vcr::use_cassette("survey_works",
                    {x <- surveys(organization_id="SDDENR")})
  testthat::expect_s3_class(x, "tbl_df")

  vcr::use_cassette("survey_unnest_works",
                    {x <- surveys(organization_id="SDDENR",
                                  .unnest = FALSE)})
  testthat::expect_s3_class(x, "tbl_df")

  vcr::use_cassette("survey_chr_works",
                    {x <- surveys(organization_id="SDDENR",
                                  tidy = FALSE)})
  testthat::expect_type(x, "character")
})

test_that("surveys returns expected errors", {
  expect_error(x <- surveys())
  expect_error(x <- surveys(organization_id = 2))

  skip_on_cran()
  webmockr::enable(quiet = TRUE)
  stub <- webmockr::stub_request("get", "https://attains.epa.gov/attains-public/api/surveys?organizationId=SDDENR")
  webmockr::to_return(stub, status = 502)
  testthat::expect_error(surveys(organization_id="SDDENR"))
  webmockr::disable(quiet = TRUE)
})

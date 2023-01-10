## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = TRUE
)
## setup vcr not sure I am doing this right.
library(vcr)
invisible(vcr::vcr_configure(
  dir = "../tests/fixtures",
  write_disk_path = "../tests/files"
))


## ----include=FALSE------------------------------------------------------------
vcr::insert_cassette("state_summary")

## ----state_summary, message=FALSE---------------------------------------------
library(rATTAINS)
x <- state_summary(organization_id = "TDECWR",
                   reporting_cycle = "2016")
x

## ----state_params, message=FALSE----------------------------------------------
x$parameters[[1]]

## ----include=FALSE------------------------------------------------------------
vcr::eject_cassette("state_summary")

## ----include=FALSE------------------------------------------------------------
vcr::insert_cassette("huc12_works")

## ----huc12, message=FALSE-----------------------------------------------------
x <- huc12_summary("020700100204")
x

## ----include=FALSE------------------------------------------------------------
vcr::eject_cassette("huc12_works")

## ----include=FALSE------------------------------------------------------------
vcr::insert_cassette("single_domain")

## ----domain_values------------------------------------------------------------
x <- domain_values(domain_name = "OrgStateCode")
x

## ----include=FALSE------------------------------------------------------------
vcr::eject_cassette("single_domain")

## ----include=FALSE------------------------------------------------------------
vcr::insert_cassette("domains_works")

## ----domain_context-----------------------------------------------------------
x <- domain_values(domain_name = "UseName", context = "TCEQMAIN")
x


## ----include=FALSE------------------------------------------------------------
vcr::eject_cassette("domains_works")


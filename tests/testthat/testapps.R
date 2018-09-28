context("app-tests")
# This file is for testing the applications in the apps/ directory.

library(shinytest)

test_that("anscombe app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","anscombe")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("continuous correlation app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","corr_continuous")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("simple reg app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","reg_simple")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("rescale app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","Rescale")
  expect_pass(testApp(appdir, compareImages = FALSE))
})



test_that("reg_constrained app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","reg_constrained")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("reg standardized app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","reg_standardized")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("dmeaned_reg app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","demeaned_reg")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("SSR_cone app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","SSR_cone")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

test_that("reg_dummy app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  # Use compareImages=FALSE because the expected image screenshots were created
  # on a Mac, and they will differ from screenshots taken on the CI platform,
  # which runs on Linux.
  appdir <- system.file(package = "ScPoEconometrics", "shinys","reg_dummy")
  expect_pass(testApp(appdir, compareImages = FALSE))
})

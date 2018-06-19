
#' launchApp: Launch an App!
#'
#' @param appname string of which app you want to run
#' This function runs the shiny app for a given `appname`. run without an argument \code{launchApp()} to see a list of available apps.
#' @export
launchApp <- function(appname) {
  # locate all the shiny app examples that exist
  validExamples <- list.files(system.file("shinys", package = "ScPoEconometrics"))

  validExamplesMsg <-
    paste0(
      "Valid apps are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(appname) || !nzchar(appname) ||
      !appname %in% validExamples) {
    stop(
      'Please run `launchApp()` with a valid app as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  # find and launch the app
  appDir <- system.file("shinys", appname, package = "ScPoEconometrics")
  shiny::runApp(appDir, display.mode = "normal")
}


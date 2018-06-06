
#' runExample: Run Examples!
#'
#' This function runs the shiny app for a given `example`. run without an argument \code{runExample()} to see a list of available apps.
#' @export
runExample <- function(example) {
  # locate all the shiny app examples that exist
  validExamples <- list.files(system.file("shinys", package = "ScPoEconometrics"))

  validExamplesMsg <-
    paste0(
      "Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(example) || !nzchar(example) ||
      !example %in% validExamples) {
    stop(
      'Please run `runExample()` with a valid example app as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  # find and launch the app
  appDir <- system.file("shinys", example, package = "ScPoEconometrics")
  shiny::runApp(appDir, display.mode = "normal")
}

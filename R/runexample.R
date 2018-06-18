
#' runExample: Run Examples!
#'
#' @param example string of which example app you want to run
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


costas <- function(){
  d = data.table(x = rnorm(1000),g = rep(1:100,each=10),u=runif(1000))
  a = 1
  b = 2
  d[,y := a + b*x + u]
  m = d[,list(y=mean(y),x=mean(x),u=mean(u)),by=g]
  m1 = lm(y~x,d)
  m2 = lm(y~x,m)
  return(list(m1,m2))
}

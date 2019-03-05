
#' runTutorial: Run a Tutorial!
#'
#' @param tutoname string of which tutorial you want to run
#' This function runs a given `tutoname` for you. run without an argument \code{runTutorial()} to see a list of available tutorials.
#' @export
runTutorial <- function(tutoname) {
  # locate all the examples that exist
  validExamples <- list.files(system.file("tutorials", package = "ScPoEconometrics"))

  validExamplesMsg <-
    paste0(
      "Valid Tutorials are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(tutoname) || !nzchar(tutoname) ||
      !tutoname %in% validExamples) {
    stop(
      'Please run `runTutorial()` with a valid tutorial as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  # find and launch
  appDir <- system.file("tutorials", tutoname, package = "ScPoEconometrics")
  rmds = list.files(path=appDir,pattern="\\.Rmd$",full.names=TRUE)
  rmarkdown::run(file = rmds[1])
}


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

#' aboutApp : get more information about an App !
#'
#' @param appname string of which app you want to get info about
#' This function opens the description of any given app
#'
#' @export
aboutApp <- function(appname){

  # locate all the shiny app examples that exist
  validExamples <- character(0)
  v <- list.files(system.file("shinys", package = "ScPoEconometrics"),full.names=TRUE)
  for (i in v){
    # if i has an about.Rmd
    if (file.exists(file.path(i,"about.Rmd"))){
      validExamples <- c(validExamples,basename(i))
    }
  }

  validExamplesMsg <-
    paste0(
      "Valid apps are: '",
      paste(validExamples, collapse = "', '"),
      "'")

  # if an invalid example is given, throw an error
  if (missing(appname) || !nzchar(appname) ||
      !appname %in% validExamples) {
    stop(
      'Please run `aboutApp()` with a valid app as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }

  # render and launch the about document
  appDir = system.file("shinys", appname, package = "ScPoEconometrics")
  rmarkdown::run(file = file.path(appDir, "about.Rmd"))
}

gitbook <- function(){
  bookdown::render_book('index.Rmd', 'bookdown::gitbook')
}

getprompt <- function(){
  return("#OUT>")
}

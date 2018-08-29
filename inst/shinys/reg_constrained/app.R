library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(

    radioButtons("const", label = h4("Parameter"),
                 choices = list("Intercept only" = 1,
                                "Slope only" = 2,
                                "Both" = 3),
                 selected = 1),

    conditionalPanel(condition = "input.const == 1",
                     wellPanel(sliderInput("i2", "Intercept", min = -5, max = 5, step = .1, value = -2),
                               h5("Slope = 0"))),

    conditionalPanel(condition = "input.const == 2",
                     wellPanel(h5("Intercept = 0"),
                               sliderInput("s2", "Slope", min = -5, max = 5, step = .1, value = -2)),
                     checkboxInput(inputId = "demean", "de-Mean x and y", value = FALSE)),

    conditionalPanel(condition = "input.const == 3",
                     wellPanel(sliderInput("ib", "Intercept", min = -5, max = 5, step = .5, value = -2),
                               sliderInput("sb", "Slope", min = -5, max = 5, step = .5, value = -1))),


    br(),

    br(),

    sliderInput("ex2", "Example:", min = 1,
                max = 3, step = 1, value = 1, ticks = FALSE),

    textOutput("userguess2")),

  mainPanel(
    plotOutput("regPlot2"),
    textOutput("MSE2")))

server <- function(input,output){
  output$userguess2 <- renderText({

    if (input$const == 1){
      a <- input$i2
      paste0("Your guess:\n y = ", a)
    } else if (input$const == 2) {
      b <- input$s2
      if (input$demean == TRUE){
        paste0("Your guess:\n [y - mean(y)] = ", b, "[x - mean(x)]")
      } else {
        paste0("Your guess:\n y = ", b, "x")
      }

    } else {
      a <- input$ib
      b <- input$sb
      paste0("Your guess:\n y = ", a, " + ", b, "x")
    }



  })

  output$regPlot2 <- renderPlot({

    set.seed(input$ex2)

    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 2)
    coeffslope <- c(2, 0, -1)
    coeffint <- c(-2, .5, 3)
    a_true <- coeffint[input$ex2]
    b_true <- coeffslope[input$ex2]
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)



    if (input$const == 1){
      # a = intercept (user input)
      a <- input$i2

      # plot
      #expr <- function(x) a
      errors <- (a) - y

      plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
           xlim = c(min(c(x, y))-1, max(c(x, y))+1),
           ylim = c(-10, 10),
           main = "The Linear Regression (with no slope!)", frame.plot = FALSE,
           cex = 1.2)
      abline(h = mean(y), col = "black", lty = "dotted")
      text(x = min(x), y = mean(y), labels = "Mean of Y", pos = 3)

      legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 3)))

      if (near(a, mean(y), tol = .05)){
        #curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        abline(h = a, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 0, green = 1, blue = 0, alpha = 0.1), border = NA)
      } else {
        #curve(expr = expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        abline(h = a, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 1, green = 0, blue = 0, alpha = 0.1), border = NA)
      }
    } else if (input$const == 2){

      if (input$demean == TRUE){
        x <- rnorm(n = 20, mean = 2, sd = 2)
        x <- x - mean(x)
        coeffslope <- c(2, 0, -1)
        coeffint <- c(-2, .5, 3)
        a_true <- coeffint[input$ex2]
        b_true <- coeffslope[input$ex2]
        y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)
        y <- y - mean(y)
      }

      b <- input$s2



      # plot



      expr <- function(x) b*x
      errors <- (b*x) - y




      plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
           xlim = c(-10, 10),
           ylim = c(-10, 10),
           main = "The Linear Regression (with no intercept term!)", frame.plot = FALSE,
           cex = 1.2)
      abline(h = 0, col = 'grey')
      abline(v = 0, col = 'grey')


      legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 3)))

      best_b = sum(x*y)/sum(x^2)

      if (near(b, best_b, .05)){
        curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 0, green = 1, blue = 0, alpha = 0.1), border = NA)
      } else {
        curve(expr = expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 1, green = 0, blue = 0, alpha = 0.1), border = NA)
      }

    } else {

      # a = intercept, b = slope (user input)
      a <- input$ib
      b <- input$sb


      # plot
      expr <- function(x) a + b*x
      errors <- (a + b*x) - y

      plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
           xlim = c(min(c(x, y))-1, max(c(x, y))+1),
           ylim = c(-10, 10),
           main = "The Linear Regression", frame.plot = FALSE,
           cex = 1.2)

      legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 3)))

      b_best = cov(x, y)/var(x)
      a_best = mean(y) - b_best*mean(x)

      if (near(a, a_best, tol = .25) && (near(b, b_best, tol = .25))){
        curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 0, green = 1, blue = 0, alpha = 0.1), border = NA)
      } else {
        curve(expr =expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
        segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
        rect(xleft = x, ybottom = y,
             xright = x + abs(errors), ytop = y + errors, density = -1,
             col = rgb(red = 1, green = 0, blue = 0, alpha = 0.1), border = NA)
      }

    }

  })

  output$MSE2 <- renderText({
    set.seed(input$ex2)

    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 2)
    coeffslope <- c(2, 0, -1)
    coeffint <- c(-2, .5, 3)
    a_true <- coeffint[input$ex2]
    b_true <- coeffslope[input$ex2]
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)

    if (input$const == 1){
      a <- input$i2

      errors <- (a) - y

      paste0("Total Sum of Squared Errors = ", sum(errors^2))

    } else if (input$const == 2){

      if (input$demean == TRUE){
        x <- rnorm(n = 20, mean = 2, sd = 2)
        x <- x - mean(x)
        coeffslope <- c(2, 0, -1)
        coeffint <- c(-2, .5, 3)
        a_true <- coeffint[input$ex2]
        b_true <- coeffslope[input$ex2]
        y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)
        y <- y - mean(y)
      }

      b <- input$s2

      errors <- (b*x) - y

      paste0("Total Sum of Squared Errors = ", sum(errors^2))

    } else {
      b <- input$sb
      a <- input$ib

      errors <- (a + (b*x)) - y

      paste0("Total Sum of Squared Errors = ", sum(errors^2))
    }

  })
}

shinyApp(ui = ui, server = server)

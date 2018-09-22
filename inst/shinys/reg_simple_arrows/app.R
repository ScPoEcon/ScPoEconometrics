library(dplyr)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_simple", "Intercept", min = -4,
                           max = 4, step = .05, value = .5),
               sliderInput("s_simple", "Slope", min = -2,
                           max = 2, step = .05, value = 0.1),
               br(),
               br(),

               textOutput("userguess_simple")),

  mainPanel(
    plotOutput("regPlot_simple"),
    textOutput("MSE")))


server <- function(input,output){
  output$userguess_simple <- renderText({

    a <- input$i_simple
    b <- input$s_simple
    paste0("Your guess:\n y = ", a, " + ", b, "x")

  })

  output$regPlot_simple <- renderPlot({

    # set.seed(19)
    #
    # # Generate Random Data
    # x <- rnorm(n = 20, mean = 2, sd = 4)
    #
    # b_true <- -0.5
    # a_true <- 1.5
    # y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 2)
    # # True DGP: y = 1.5 -2 * x + u

    # get data from disk
    load(file = system.file(package = "ScPoEconometrics","datasets","simple_arrows.RData"))

    # a = intercept, b = slope (user input)
    a <- input$i_simple
    b <- input$s_simple


    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         # xlim = c(min(c(x))-1, max(c(x))+1),
         # ylim = c(min(c(y))-1, max(c(y))+1),
         main = "Find the Best Line! (Arrows turn Green!)", frame.plot = FALSE,
         cex = 1.2)

    if ((a == a_true) && (b == b_true)){
      curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      arrows(x, expr(x),
             x, y,
             col = 'green', lwd = 1, lty = 1, length = 0.1, angle = 20)
    } else {
      curve(expr =expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      arrows(x, expr(x),
             x, y,
             col = 'red', lwd = 1, lty = 1, length = 0.1, angle = 20)
    }
    })

    output$MSE <- renderText({
      # set.seed(19)
      # # Generate Random Data
      # x <- rnorm(n = 20, mean = 2, sd = 4)
      # b_true <- -0.5
      # a_true <- 1.5
      # y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 2)
      # # True DGP: y = -2 + 1.5 * x + u

      # get data from disk
      load(file = system.file(package = "ScPoEconometrics","datasets","simple_arrows.RData"))


      # a = intercept, b = slope (user input)
      a <- input$i_simple
      b <- input$s_simple


      # plot
      expr <- function(x) a + b*x
      errors <- (a + b*x) - y

      paste0("Total Sum of Errors = ", round(sum(errors),2)," || Total Sum of absolute Errors = ", round(sum(abs(errors)),2))

    })
}


shinyApp(ui = ui, server = server)

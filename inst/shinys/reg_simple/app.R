library(dplyr)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_simple", "Intercept", min = -4,
                           max = 4, step = .1, value = .5),
               sliderInput("s_simple", "Slope", min = -2,
                           max = 2, step = .1, value = -1),
               br(),
               br(),

               textOutput("userguess_simple")),

  mainPanel(
    plotOutput("regPlot_simple")),
    textOutput("MSE2"))


server <- function(input,output){
  output$userguess_simple <- renderText({

    a <- input$i_simple
    b <- input$s_simple
    paste0("Your guess:\n y = ", a, " + ", b, "x")

  })

  output$regPlot_simple <- renderPlot({

    set.seed(19)

    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 4)

    a_true <- -2
    b_true <- 1.5
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)
    # True DGP: y = -2 + 1.5 * x + u



    # a = intercept, b = slope (user input)
    a <- input$i_simple
    b <- input$s_simple


    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         xlim = c(min(c(x, y))-1, max(c(x, y))+1),
         ylim = c(min(c(x, y))-1, max(c(x, y))+1),
         main = "Fit the data!", frame.plot = FALSE,
         cex = 1.2)

    if ((a == a_true) && (b == b_true)){
      curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 0, green = 1, blue = 0, alpha = 0.05), border = NA)
    } else {
      curve(expr =expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 1, green = 0, blue = 0, alpha = 0.05), border = NA)
    }

  })

  output$MSE2 <- renderText({
    set.seed(19)

    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 4)

    a_true <- -2
    b_true <- 1.5
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1)
    # True DGP: y = -2 + 1.5 * x + u



    # a = intercept, b = slope (user input)
    a <- input$i_simple
    b <- input$s_simple


    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    paste0("Total Sum of Squared Errors = ", round(sum(errors^2),2))

  })

}

shinyApp(ui = ui, server = server)

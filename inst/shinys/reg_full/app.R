library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i", "Intercept", min = -4,
                           max = 4, step = 2, value = -2),
               sliderInput("s", "Slope", min = -2,
                           max = 2, step = .5, value = 1),
               br(),
               br(),

               sliderInput("ex", "Example:", min = 1,
                           max = 10, step = 1, value = 1, ticks = FALSE),
               sliderInput("noise", "Noise Level:", min = 0,
                           max = 2, step = .5, value = 1),

               textOutput("userguess")),

  mainPanel(

    plotOutput("regPlot"),
    textOutput("MSE")))



server <- function(input,output){
  output$userguess <- renderText({

    a <- input$i
    b <- input$s
    paste0("Your guess:\n y = ", a, " + ", b, "x")

  })

  output$regPlot <- renderPlot({

    set.seed(input$ex)

    # Generate Random Data
    x <- rnorm(n = 20, mean = 0, sd = 4)
    coeffslope <- c(-2, -1.5, -1, -.5, 0, .5, 1, 1.5, 2)
    coeffint <- c(-4, -2, 0, 2, 4)
    a_true <- sample(coeffint, size = 1)
    b_true <- sample(coeffslope, size = 1)
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = input$noise)
    # True DGP: y = a_t + b_t * x + u



    # a = intercept, b = slope (user input)
    a <- input$i
    b <- input$s


    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         xlim = c(min(c(x, y))-1, max(c(x, y))+1),
         ylim = c(min(c(x, y))-1, max(c(x, y))+1),
         main = "The Linear Regression", frame.plot = FALSE,
         cex = 1.2)

    legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 3)))

    if ((a == a_true) && (b == b_true)){
      curve(expr = expr, from = min(x)-10, to = max(x)+10, add = T, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 0, green = 1, blue = 0, alpha = 0.1), border = NA)
    } else {
      curve(expr =expr , from = min(x)-10, to = max(x)+10, add = T, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 1, green = 0, blue = 0, alpha = 0.1), border = NA)
    }

  })

  output$MSE <- renderText({
    set.seed(input$ex)
    x <- rnorm(n = 20, mean = 0, sd = 4)
    coeffslope <- c(-2, -1.5, -1, -.5, 0, .5, 1, 1.5, 2)
    coeffint <- c(-4, -2, 0, 2, 4)
    a_true <- sample(coeffint, size = 1)
    b_true <- sample(coeffslope, size = 1)
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = input$noise)
    a <- input$i
    b <- input$s

    errors <- (a + b*x) - y

    paste0("Total Sum of Squared Errors = ", sum(errors^2))
  })
}

shinyApp(ui = ui, server = server)
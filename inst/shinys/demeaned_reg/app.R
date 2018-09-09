library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_dm", "Intercept", min = -2,
                           max = 2, step = .5, value = .5),
               sliderInput("s_dm", "Slope", min = -2,
                           max = 2, step = .1, value = .1),

               checkboxInput("dm", "De-mean X and Y!", value = FALSE),

               br(),
               br(),

               textOutput("userguess_dm")),

  mainPanel(
    plotOutput("regPlot_dm")))

server <- function(input,output){
  output$userguess_dm <- renderText({

    if (input$dm == FALSE){
      a <- input$i_dm
      b <- input$s_dm
      paste0("Your guess:\n y = ", a, " + ", b, "x")
    } else {
      a <- input$i_dm
      b <- input$s_dm
      paste0("Your guess:\n [y - mean(y)] = ", a, " + ", b, " [x - mean(x)]")
    }


  })

  output$regPlot_dm <- renderPlot({

    set.seed(42)


    #Load Data

    data <- read.csv(file = system.file(package = "ScPoEconometrics","datasets","corr50.csv"), header = FALSE)
    x <- data[[1]] *.45
    y <- data[[2]]

    if (input$dm == TRUE){
      x <- x - mean(x)
      y <- y - mean(y)
    }



    # a = intercept, b = slope (user input)
    a <- input$i_dm
    b <- input$s_dm

    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         xlim = c(-5, 15),
         ylim = c(-5, 10),
         main = "Fit the data!", frame.plot = FALSE,
         cex = 1.2)
    legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 2)))

    b_best <- cov(x, y)/var(x)
    a_best <- mean(y) - b_best*mean(x)

    if (near(a, a_best, tol = .25) && near(b, b_best, tol = .05)){
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
}

shinyApp(ui = ui, server = server)

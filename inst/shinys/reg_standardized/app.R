library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_std", "Intercept", min = -2,
                           max = 4, step = .1, value = 2),
               sliderInput("s_std", "Slope", min = -1,
                           max = 1, step = .1, value = -.2),

               checkboxInput("std", "Standardize X and Y!", value = FALSE),

               br(),
               br(),

               textOutput("userguess_std")),

  mainPanel(
    plotOutput("regPlot_std")))

server <- function(input,output){
  output$userguess_std <- renderText({

    if (input$std == FALSE){
      a <- input$i_std
      b <- input$s_std
      paste0("Your guess:\n y = ", a, " + ", b, "x")
    } else {
      a <- input$i_std
      b <- input$s_std
      paste0("Your guess:\n [y / SD(y)] = ", a, " + ", b, "[x / SD(x)]")
    }


  })

  output$regPlot_std <- renderPlot({

    set.seed(19)
    n = 20
    x = 2*runif(n)
    b0 = 2.4
    b1 = 0.8
    y = b0 + b1*x + rnorm(n)

    if (input$std == TRUE){
      x <- (x-mean(x))/sd(x)
      y <- (y-mean(y))/sd(y)
    }

    # a = intercept, b = slope (user input)
    a <- input$i_std
    b <- input$s_std

    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         ylim = c(min(y)-2, max(y)+2),
         # ylim = c(-5, 10),
         main = "Fit the data!", frame.plot = FALSE,
         cex = 1.2)
    legend("topleft", legend = paste0("r (correlation coefficient) = ", round(cor(x, y), 2)))

    b_best <- cov(x, y)/var(x)
    a_best <- mean(y) - b_best*mean(x)

    offset = 4


    if (input$std == TRUE){
      b0new = 0
      b1new = round(cor(x, y), 1)
    } else {
      b0new = b0
      b1new = b1
    }


    # if (near(a, b0, tol = .01) && near(b, b1, tol = .01)){
    if (a==b0new && near(b, b1new, tol = .01)){

      curve(expr = expr, from = min(x)-offset, to = max(x)+offset, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 0, green = 1, blue = 0, alpha = 0.05), border = NA)
    } else {
      curve(expr =expr , from = min(x)-offset, to = max(x)+offset, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 1, green = 0, blue = 0, alpha = 0.05), border = NA)
    }

  })
}

shinyApp(ui = ui, server = server)

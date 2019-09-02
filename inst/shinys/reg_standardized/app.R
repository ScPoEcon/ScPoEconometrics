library(shiny)

set.seed(19)
n = 20
x = 2*runif(n)
b0 = 2.5
b1 = 0.8
y = b0 + b1*x + rnorm(n)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_std", "Intercept", min = -2,
                           max = 4, step = .5, value = 2),
               sliderInput("s_std", "Slope", min = -1,
                           max = 2, step = .1, value = -.2),

               checkboxInput("std", "Standardize X and Y!", value = FALSE),

               br(),
               br(),

               verbatimTextOutput("userguess_std")),

  mainPanel(
    plotOutput("regPlot_std")))

server <- function(input,output){
  output$userguess_std <- renderText({

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

    if (input$std == FALSE){
      a <- input$i_std
      b <- input$s_std
      paste0("Your guess:\n y = ", a, " + ", b, "x\n SSR: ", sum(errors^2) )
    } else {
      a <- input$i_std
      b <- input$s_std
      paste0("Your guess:\n [y / SD(y)] = ", a, " + ", b, "[x / SD(x)]\n SSR: ", sum(errors^2))
    }


  })

  output$regPlot_std <- renderPlot({

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

    b_best <- b1
    a_best <- b0

    offset = 4


    if (input$std == TRUE){
      b0new = 0
      b1new = round(cor(x, y), 1)
    } else {
      b0new = b0
      b1new = b1
    }


    # if (near(a, b0, tol = .01) && near(b, b1, tol = .01)){
    if (a==b0new && dplyr::near(b, b1new, tol = .01)){

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

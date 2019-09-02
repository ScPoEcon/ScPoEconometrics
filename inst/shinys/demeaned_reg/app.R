library(dplyr)
library(plotly)
library(shiny)

data <- ScPoEconometrics:::get_lm(a = 2,b = 1.2, xscale = 5, escale = 3)


ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_dm", "Intercept", min = -2,
                           max = 3, step = .5, value = .5),
               sliderInput("s_dm", "Slope", min = -2,
                           max = 2, step = .1, value = .1),

               checkboxInput("dm", "De-mean X and Y!", value = FALSE),

               br(),
               br(),

               verbatimTextOutput("userguess_dm")),

  mainPanel(
    plotOutput("regPlot_dm")))

server <- function(input,output){
  output$userguess_dm <- renderText({
    x = data$x
    y = data$y

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

    if (input$dm == FALSE){
      paste0("Your guess:\ny = ", a, " + ", b, "x.\nSSR = ",round(mean(errors^2),2))
    } else {
      paste0("Your guess:\n[y - mean(y)] = ", a, " + ", b, " [x - mean(x)].\nSSR = ",round(mean(errors^2),2))
    }


  })

  output$regPlot_dm <- renderPlot({
    #Load Data
    x = data$x
    y = data$y

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

    yl = range(data$y)
    yl[1] = yl[1] - abs(yl[1])*0.1
    yl[2] = yl[2] + abs(yl[2])*0.1
    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         # xlim = c(-1 * (xscale+1) , (xscale+1) ),
         # ylim = yl,
         # ylim = c(-5, 10),
         main = "Fit the data!", frame.plot = FALSE,
         cex = 1.2)


    b_true <- data$b
    a_true <- ifelse(input$dm, 0, data$a)

    if (a == a_true && b == b_true) {
      # plot green
      curve(expr = expr, from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "green")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 0, green = 1, blue = 0, alpha = 0.05), border = NA)
    } else {
      # plot red
      curve(expr =expr , from = min(x)-10, to = max(x)+10, add = TRUE, col = "black")
      segments(x0 = x, y0 = y, x1 = x, y1 = (y + errors), col = "red")
      rect(xleft = x, ybottom = y,
           xright = x + abs(errors), ytop = y + errors, density = -1,
           col = rgb(red = 1, green = 0, blue = 0, alpha = 0.05), border = NA)
    }
    if (input$dm == TRUE){
      abline(h=0,col='blue',lty='dashed')
      abline(v=0,col='blue',lty='dashed')
    }

  })
}

shinyApp(ui = ui, server = server)

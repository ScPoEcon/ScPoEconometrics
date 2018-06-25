library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_dummy", "Intercept", min = 0,
                           max = 5, step = .25, value = 3),
               sliderInput("s_dummy", "Slope", min = -1,
                           max = 5, step = .25, value = 2),

               checkboxInput("meany", "Show E[Y]", value = FALSE),
               checkboxInput("meany_x0", "Show E[Y | X = 0]", value = FALSE),
               checkboxInput("meany_x1", "Show E[Y | X = 1]", value = FALSE),


               br(),
               br(),

               textOutput("userguess_dummy")),

  mainPanel(
    plotOutput("regPlot_dummy")))



server <- function(input,output){

  output$userguess_dummy <- renderText({

    a <- input$i_dummy
    b <- input$s_dummy
    paste0("Your guess:\n y = ", a, " + ", b, "x")

  })

  output$regPlot_dummy <- renderPlot({

    set.seed(19)

    # Generate Random Data
    dta <- data.frame(x = sample(x = c(0, 1), size = 20, replace = T),
                      y = rnorm(n = 20, mean = 2, sd = 1))
    dta[dta$x == 1, "y"] <- dta[dta$x == 1, "y"] + 3

    x <- dta[, "x"]
    y <- dta[, "y"]
    #y = 2 + 3*x + u


    # a = intercept, b = slope (user input)
    a <- input$i_dummy
    b <- input$s_dummy

    # plot
    errors <- (a + b*x) - y

    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=.25,
         xlim = c(-.1, 1.1),
         ylim = c(min(y)-.1, max(y)+.1),
         main = "Fit the data!", frame.plot = T,
         cex = 1.2)
    if (input$meany_x0 == T){
      points(0, mean(dta[dta$x == 0, "y"]), col = 'orange',
             cex = 3, pch = 15)
      text(0.05, mean(dta[dta$x == 0, "y"]), "E[Y | X = 0]", pos = 4)
    }
    if (input$meany_x1 == T){
      points(1, mean(dta[dta$x == 1, "y"]), col = 'orange',
             cex = 3, pch = 15)
      text(1.05, mean(dta[dta$x == 1, "y"]), "E[Y | X = 1]", pos = 4)
    }
    if (input$meany == T){
    abline(a=mean(dta$y),b=0,col="grey",lw=2)
    }


    b_true = cov(x, y)/var(x)
    a_true = mean(y) - b_true*mean(x)
    expr <- function(x) a_true + b_true*x


    if (near(a, a_true, tol = .125) && near(b, b_true, tol = .125)){
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

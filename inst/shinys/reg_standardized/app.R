library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("i_std", "Intercept", min = -2,
                           max = 2, step = .5, value = .5),
               sliderInput("s_std", "Slope", min = -2,
                           max = 2, step = .1, value = .1),
               
               checkboxInput("std", "Standardize X and Y!", value = F),
               
               br(),
               br(),
               
               textOutput("userguess_std")),
  
  mainPanel(
    plotOutput("regPlot_std")))

server <- function(input,output){
  output$userguess_std <- renderText({
    
    if (input$std == F){
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
    
    
    #Load Data
    
    data <- read.csv(file = "~/GIT/ScPoEconometrics/data/corr50.csv", header = F)
    x <- data[[1]] *.45
    y <- data[[2]]
    
    if (input$std == T){
      x <- x/sd(x)
      y <- y/sd(y)
    }
    
    
    
    # a = intercept, b = slope (user input)
    a <- input$i_std
    b <- input$s_std
    
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
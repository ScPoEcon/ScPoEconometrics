library(dplyr)
library(plotly)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(
  
  column(width = 2,
         sliderInput("i_ssr", "Intercept", min = -4,
                     max = 4, step = .25, value = .5),
         sliderInput("s_ssr", "Slope", min = -4,
                     max = 4, step = .25, value = -1),
         br(),
         br(),
         
         textOutput("userguess_ssr")),
  
  column(width = 4,
         plotOutput("regPlot_ssr")),
  
  column(width = 6,
         plotlyOutput("SSR_cone"))
  
))

server <- function(input,output){
  output$userguess_ssr <- renderText({
    
    a <- input$i_ssr
    b <- input$s_ssr
    paste0("Your guess:\n y = ", a, " + ", b, "x")
    
  })
  
  output$regPlot_ssr <- renderPlot({
    
    set.seed(19)
    
    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 4)
    
    a_true <- -2
    b_true <- 1.5
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1.5)
    # True DGP: y = -2 + 1.5 * x + u
    
    # a = intercept, b = slope (user input)
    a <- input$i_ssr
    b <- input$s_ssr
    
    # plot
    expr <- function(x) a + b*x
    errors <- (a + b*x) - y 
    
    plot(x, y, type = "p", pch = 21, col = "blue", bg = "royalblue", asp=1,
         xlim = c(min(c(x, y))-1, max(c(x, y))+1),
         ylim = c(min(c(x, y))-1, max(c(x, y))+1),
         main = "Fit the data!", frame.plot = FALSE,
         cex = 1.2)
    
    b_best = cov(x, y)/var(x) #approx. 1.25
    a_best = mean(y) - b_best*mean(x) #approx -1
    
    if (near(a, a_best, tol = .125) &&  near(b, b_best, tol = .125)){
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
  
  output$SSR_cone <- renderPlotly({
    set.seed(19)
    
    # Generate Random Data
    x <- rnorm(n = 20, mean = 2, sd = 4)
    
    a_true <- -2
    b_true <- 1.5
    y <- a_true + b_true*x + rnorm(n = 20, mean = 0, sd = 1.5)
    # True DGP: y = -2 + 1.5 * x + u
    
    # a = intercept, b = slope (user input)
    a <- input$i_ssr
    b <- input$s_ssr
    
    # plot cone
    
    ssr <- function(a_, b_){
      return(sum(((a_ + b_*x) - y)^2))
    }
    
    possible_a <- seq(-4, 4, .25)
    possible_b <- seq(-4, 4, .25)
    
    df <- data.frame(a = rep(possible_a, each = length(possible_b)),
                     b = rep(possible_b, times = length(possible_b)))
    
    df <- cbind(df, mapply(ssr, df$a, df$b))
    colnames(df) <- c("a", "b", "ssr")
    
    annot <- data.frame(a_ = a, b_ = b, ssr_ = ssr(a, b))
    
    # camera
    # https://plot.ly/python/3d-camera-controls/
    scene = list(camera = list(eye = list(x = 2.5, y = 0.1, z = 0.5)))
    plot_ly(x=possible_a,y=possible_b, z=matrix(df$ssr,c(length(possible_a),length(possible_b))),type="surface",colors = "YlOrRd", opacity = .85) %>%
      add_trace(data=annot,x = ~a_, y = ~b_, z = ~ssr_,mode="markers",type="scatter3d",marker=list(size=5,color="black",symbol=104)) %>%
      colorbar(title = "Sum of Squared\nResiduals") %>%
      layout(title = "\nYour guess is the black dot\n(You can move around the plot!)",
             xaxis=list(range=c(-6,6)), yaxis=list(range=c(-6,6)),scene=scene)
 

  })
}

shinyApp(ui = ui, server = server)

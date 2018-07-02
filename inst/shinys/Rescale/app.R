library(shiny)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("scale_x", "Rescale X", min = -5,
                           max = 5, step = .5, value = 1),
               sliderInput("scale_y", "Rescale Y", min = -5,
                           max = 5, step = .5, value = 1),
               br(),
               br(),

               verbatimTextOutput("best_fit")),

  mainPanel(
    plotOutput("regPlot_rescale"),
    verbatimTextOutput("DGP")))



server <- function(input,output){
  output$best_fit <- renderText({

    set.seed(19)
    x <- rnorm(50, 2, 10)
    y <- 10 + 3*x + rnorm(50, 0, 10)

    s_x <- input$scale_x
    s_y <- input$scale_y

    orig_slope <- (cov(x, y)/var(x))
    orig_inter <- mean(y) - orig_slope*mean(x)

    best_slope <- (s_y/s_x) * orig_slope #scale
    best_inter <- s_y * orig_inter

    if (s_x != 0){
      paste0("Original Slope: ", round(orig_slope, 3),
             "\nOriginal Intercept: ", round(orig_inter, 3),
             "\nCurrent Slope: ", round(best_slope, 3),
             "\nCurrent Intercept: ", round(best_inter, 3))
    } else {
      paste0("Original Slope: ", round(orig_slope, 3),
             "\nOriginal Intercept: ", round(orig_inter, 3),
             "\nCurrent Slope: ", round(best_slope, 3),
             "\nCurrent Intercept: ", round(best_inter, 3),
             "\n\nRemember that, when X = 0, the best linear predictor of Y is simply its (potentially rescaled) mean!")
    }
  })

  output$regPlot_rescale <- renderPlot({

    set.seed(19)

    x <- rnorm(50, 2, 5)
    y <- 10 + 3*x + rnorm(50, 0, 10)

    s_x <- input$scale_x
    s_y <- input$scale_y

    fit <- lm(y ~ x, data.frame(x = (s_x*x), y = (s_y*y)))


    plot((s_x*x), (s_y*y), type = "p", pch = 21, col = "blue", bg = "royalblue",
         xlim = c(-50, 50),
         xlab = paste0(s_x, "X"),
         ylim = c(-200, 300),
         ylab = paste0(s_y, "Y"),
         main = "Rescale X and Y", frame.plot = FALSE,
         cex = 1.2)
    abline(v = 0, lty="dashed")
    if (s_x != 0){
      abline(fit, col = "green", lw = 2)
    }
  })

  output$DGP <- renderText({
    paste0("Data Generating Process: Y = 10 + 3X + error\nSample Size N = 50")
  })

}

shinyApp(ui = ui, server = server)

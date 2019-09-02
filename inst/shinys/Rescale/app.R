library(shiny)

rd = 1  # digits to round

set.seed(19)
n = 20
sigma = 5

x <- rnorm(n, 2, 1)
a_true = 10
b_true = 3
y <- a_true + b_true*x + rnorm(n, 0, sigma)

ui <- fluidPage(
  br(),
  br(),
  sidebarPanel(sliderInput("scale_x", "Rescale X", min = -2,
                           max = 2, step = .5, value = 1),
               sliderInput("scale_y", "Rescale Y", min = -0.5,
                           max = 2, step = .5, value = 1),
               br(),
               br(),

               verbatimTextOutput("best_fit")),

  mainPanel(
    plotOutput("regPlot_rescale"),
    verbatimTextOutput("DGP")))



server <- function(input,output){
  output$best_fit <- renderText({

    s_x <- input$scale_x
    s_y <- input$scale_y

    orig_slope <- b_true
    orig_inter <- a_true

    best_slope <- (s_y/s_x) * orig_slope #scale
    best_inter <- s_y * orig_inter

    if (s_x != 0){
      paste0("Original Slope: ", round(orig_slope, rd),
             "\nOriginal Intercept: ", round(orig_inter, rd),
             "\nCurrent Slope: ", round(best_slope, rd),
             "\nCurrent Intercept: ", round(best_inter, rd))
    } else {
      paste0("Original Slope: ", round(orig_slope, rd),
             "\nOriginal Intercept: ", round(orig_inter, rd),
             "\nCurrent Slope: ", round(best_slope, rd),
             "\nCurrent Intercept: ", round(best_inter, rd),
             "\n\nRemember that, when X = 0, the best linear predictor of Y is simply its (potentially rescaled) mean!")
    }
  })

  output$regPlot_rescale <- renderPlot({

    s_x <- input$scale_x
    s_y <- input$scale_y

    fit <- lm(y ~ x, data.frame(x = (s_x*x), y = (s_y*y)))

    plot((s_x*x), (s_y*y), type = "p", pch = 21, col = "blue", bg = "royalblue",
         xlim = c(-5, 10),
         xlab = paste0(s_x, "X"),
         ylim = c(-10, 45),
         ylab = paste0(s_y, "Y"),
         main = "Rescale X and Y", frame.plot = FALSE,
         cex = 1.)
    abline(v = 0, lty="dashed")
    if (s_x != 0){
      abline(fit, col = "green", lw = 2)
    }
  })

  output$DGP <- renderText({
    paste0("Data Generating Process: Y = 10 + 3X + error")
  })

}

shinyApp(ui = ui, server = server)

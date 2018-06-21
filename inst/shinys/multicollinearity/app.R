library(dplyr)
library(plotly)
library(mvtnorm)
library(reshape2)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(

    column(width = 3,
           sliderInput("corr_x1x2", "Correlation(x1, x2)", min = 0,
                       max = 1, step = .01, value = 0),
           br(),
           br(),

           textOutput("standarderrors")),

    column(width = 9,
           plotlyOutput("planefit"))

))

server <- function(input,output){

  output$planefit <- renderPlotly({

    set.seed(42)

    #Generate Data
    x <- rmvnorm(100, mean = c(0, 0), sigma = matrix(c(1, input$corr_x1x2,
                                                       input$corr_x1x2, 1),
                                                     c(2,2)))
    y <- 1 + 2*x[,1] - x[,2] + rnorm(100, 0, 5)
    df <- as.data.frame(cbind(x, y))
    colnames(df) <- c("x1", "x2", "y")

    fit <- lm(y~x1+x2, df)

    #plot best fit
    plotting_data <- data.frame(x1 = rep(c(min(x[,1]), max(x[,1])), 2),
                                x2 = rep(c(min(x[,2]), max(x[,2])), each =2))

    plotting_data <- cbind(plotting_data, predict.lm(fit, plotting_data))

    surf <- reshape2::acast(plotting_data, x2~x1)

    df %>% plot_ly() %>%
      add_markers(x = ~x1, y = ~x2, z = ~y,
                  marker = list(color = 'red', size = 5),
                  opacity = .5,
                  name = "Data") %>%
      add_surface(x = c(min(x[,2]), max(x[,2])),
                  y = c(min(x[,1]), max(x[,1])),
                  z = surf, opacity = .5, surfacecolor = rep('grey', 2)) %>%
      hide_colorbar()%>%
      layout(title="Best Fit Plane")
  })

  output$standarderrors <- renderText({

    set.seed(42)

    #Generate Data
    x <- rmvnorm(100, mean = c(0, 0), sigma = matrix(c(1, input$corr_x1x2,
                                                       input$corr_x1x2, 1),
                                                     c(2,2)))
    y <- 1 + 2*x[,1] - x[,2] + rnorm(100, 0, 5)
    df <- as.data.frame(cbind(x, y))
    colnames(df) <- c("x1", "x2", "y")

    fit <- lm(y~x1+x2, df)

    print(paste0("Standard Error Beta(x1): ", round(summary(fit)$coefficients[, 2]["x1"], 4),
           "\nStandard Error Beta(x2): ", round(summary(fit)$coefficients[, 2]["x2"], 4)))

  })



}

shinyApp(ui = ui, server = server)

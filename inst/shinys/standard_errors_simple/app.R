library(plotly)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(column(width = 6, plotlyOutput("sample")),
           column(width = 3, plotlyOutput("hist_a")),
           column(width = 3, plotlyOutput("hist_b"))),
  column(6, align = 'center', actionButton("new", "New Draw!"), actionButton("new_n", "10 New Draws!"))
)

server <- function(input, output){
  set.seed(19)
  df <- as.data.frame(matrix(rep(0, 20*1000), c(20, 1000)))

  for (i in seq(1, 999, 2)){
    df[i] <- rnorm(20, 5, 2)
    df[i+1] <- 5 + 2*df[i] + rnorm(20, 0, 5)
  }

  ab <- as.data.frame(matrix(rep(NA, 2*999), c(999, 2)))
  colnames(ab) <- c("a", "b")

  for (i in seq(1, 999, 2)){
    ab[i, "a"] <- cov(df[[i]], df[[i+1]])/var(df[[i]])
  }
  for (i in seq(1, 999, 2)){
    ab[i, "b"] <- mean(df[[i+1]]) - ab$a[i] * mean(df[[i]])
  }


  counter <- reactiveValues(j = 3) #define the counter j as a reactiveValue (stored in the list "counter")

  observeEvent(input$new, { #dynamically update counter j, handle j > 999
    if (counter$j > 999){
      counter$j <- 3
    } else {
      counter$j <- (counter$j + 2)
    }
  })

  observeEvent(input$new_n, { #dynamically update counter j, handle j > 9999
    if (counter$j > 999){
      counter$j <- 3
    } else {
      counter$j <- (counter$j + 20)
    }
  })


  output$sample <- renderPlotly({

    slope_current <- (cov(df[[counter$j]], df[[counter$j + 1]]))/var(df[[counter$j]])
    inter_current <- mean(df[[counter$j + 1]]) - slope_current*mean(df[[counter$j]])

    slope_past <- (cov(df[[counter$j - 2]], df[[counter$j - 1]]))/var(df[[counter$j - 2]])
    inter_past <- mean(df[[counter$j - 1]]) - slope_past*mean(df[[counter$j - 2]])

    #Plot

    plot_ly() %>%
      add_markers(x = df[[counter$j]], y = df[[counter$j+1]],
                  opacity = 1, marker = list(color = 'blue'),
                  name = "Current Draw") %>%
      add_markers(x = df[[counter$j-2]], y = df[[counter$j-1]],
                  opacity = .5, marker = list(color = 'blue'),
                  name = "Past Draw") %>%

      add_lines(x = c(0, 10), y = c(inter_current, inter_current + 10*slope_current),
                name = "Current Best Fit", line = list(color = 'green')) %>%
      add_lines(x = c(0, 10), y = c(inter_past, inter_past + 10*slope_past),
                name = "Past Best Fit", opacity = .5, line = list(color = 'green')) %>%
      add_lines(x = c(0, 10), y = c(5,  25),
                name = "Population Regression Line", opacity = .25,
                line = list(color = 'grey', dash = 'dash')) %>%

      layout(title = "Fitted Sample of n = 20 Draws From the Population",
             xaxis = list(range = c(-1, 10), showgrid = F, title = "X"),
             yaxis = list(range = c(0, 30), showgrid = F, title = "Y"))
  })

  output$hist_a <- renderPlotly({
    ab[3:counter$j, ] %>% plot_ly() %>%
      add_histogram(x = ~b, histnorm = "probability") %>%
      layout(title = "Distribution of Estimated Intercepts",
             xaxis = list(title = "Estimated Intercepts"))
  })

  output$hist_b <- renderPlotly({
    ab[3:counter$j, ] %>% plot_ly() %>%
      add_histogram(x = ~a, histnorm = "probability") %>%
      layout(title = "Distribution of Estimated Slopes",
             xaxis = list(title = "Estimated Slopes"))
  })
}

shinyApp(ui = ui, server = server)

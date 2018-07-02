library(plotly)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(column(width = 6, align = 'center', actionButton("new_f", "New Draw!")),

           #column(width = 4, sliderInput("noise", "DGP Noisiness", min = 0, max = 5, step = 2.5, value = 2.5)),

           column(width = 6, align = 'center', sliderInput("n_f", "N", min = 10, max = 300, step = 10, value = 10), actionButton("new_nf", "10 New Draws!"))),

  fluidRow(column(width = 6, plotlyOutput("sample_f")),
           column(width = 3, plotlyOutput("hist_a_f")),
           column(width = 3, plotlyOutput("hist_b_f"))),

  fluidRow(column(6, offset = 6, align = 'center', verbatimTextOutput("counter_f")))

)

server <- function(input, output){
  set.seed(19)

  df <- as.data.frame(matrix(rep(0, 300 * 1000), c(300, 1000)))

  for (i in seq(1, 999, 2)){
    df[i] <- rnorm(300, 5, 2)
    df[i+1] <- 5 + 2*df[i] + rnorm(300, 0, 5)
  }


  counter <- reactiveValues(j = 3) #define the counter j as a reactiveValue (stored in the list "counter")

  observeEvent(input$new_f, { #dynamically update counter j, handle j > 999
    if (counter$j > 999){
      counter$j <- 3
    } else {
      counter$j <- (counter$j + 2)
    }
  })

  observeEvent(input$new_nf, { #dynamically update counter j, handle j > 9999
    if (counter$j > 999){
      counter$j <- 3
    } else {
      counter$j <- (counter$j + 20)
    }
  })


  output$sample_f <- renderPlotly({

    slope_current <- (cov(df[1:input$n_f, counter$j], df[1:input$n_f, counter$j + 1]))/var(df[1:input$n_f, counter$j])
    inter_current <- mean(df[1:input$n_f, counter$j + 1]) - slope_current*mean(df[1:input$n_f, counter$j])

    slope_past <- (cov(df[1:input$n_f, counter$j - 2], df[1:input$n_f, counter$j - 1]))/var(df[1:input$n_f, counter$j - 2])
    inter_past <- mean(df[1:input$n_f, counter$j - 1]) - slope_past*mean(df[1:input$n_f, counter$j - 2])


    #Plot

    plot_ly() %>%
      add_markers(x = df[1:input$n_f, counter$j], y = df[1:input$n_f, counter$j+1],
                  opacity = .75, marker = list(color = 'blue'),
                  name = "Current Draw") %>%
      add_markers(x = df[1:input$n_f, counter$j-2], y = df[1:input$n_f, counter$j-1],
                  opacity = .15, marker = list(color = 'blue'),
                  name = "Past Draw") %>%

      add_lines(x = c(0, 10), y = c(inter_current, inter_current + 10*slope_current),
                name = "Current Best Fit", line = list(color = 'green')) %>%
      add_lines(x = c(0, 10), y = c(inter_past, inter_past + 10*slope_past),
                name = "Past Best Fit", opacity = .15, line = list(color = 'green')) %>%
      add_lines(x = c(0, 10), y = c(5,  25),
                name = "Population Regression Line", opacity = 1,
                line = list(color = 'darkgrey', dash = 'dash')) %>%

      layout(title = paste0("Fitted Samples of n = ",  input$n_f, " Draws From the Population"),
             xaxis = list(range = c(-1, 10), showgrid = F, title = "X"),
             yaxis = list(range = c(0, 30), showgrid = F, title = "Y"))
  })

  output$hist_a_f <- renderPlotly({

    ab <- as.data.frame(matrix(rep(NA, 2*999), c(999, 2)))
    colnames(ab) <- c("a", "b")

    for (i in seq(1, 999, 2)){
      ab[i, "a"] <- cov(df[1:input$n_f , i], df[1:input$n_f, i+1])/var(df[[i]])
    }
    for (i in seq(1, 999, 2)){
      ab[i, "b"] <- mean(df[1:input$n_f, i+1]) - ab$a[i] * mean(df[1:input$n_f, i])
    }

    ab[3:counter$j, ] %>% plot_ly() %>%
      add_histogram(x = ~b, histnorm = "probability") %>%
      layout(xaxis = list(title = "Estimated Intercepts",
                          range = c(-3,15)),
             yaxis = list(range = c(0,0.16))
      )
  })

  output$hist_b_f <- renderPlotly({

    ab <- as.data.frame(matrix(rep(NA, 2*999), c(999, 2)))
    colnames(ab) <- c("a", "b")

    for (i in seq(1, 999, 2)){
      ab[i, "a"] <- cov(df[1:input$n_f , i], df[1:input$n_f, i+1])/var(df[[i]])
    }
    for (i in seq(1, 999, 2)){
      ab[i, "b"] <- mean(df[1:input$n_f, i+1]) - ab$a[i] * mean(df[1:input$n_f, i])
    }

    ab[3:counter$j, ] %>% plot_ly() %>%
      add_histogram(x = ~a, histnorm = "probability") %>%
      layout(xaxis = list(title = "Estimated Slopes",
                          range = c(0,5)),
             yaxis = list(range = c(0,0.16))
      )
  })

  output$counter_f <- renderText({

    paste0("Number of Draws: ", (.5 + .5 * counter$j))

  })

}


shinyApp(ui = ui, server = server)

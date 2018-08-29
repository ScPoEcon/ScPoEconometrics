library(plotly)

ui <- fluidPage(
  br(),
  br(),
  actionButton("new", "New Draw!"),
  plotlyOutput("sample")
)

server <- function(input, output){
  set.seed(19)
  df <- as.data.frame(matrix(rep(0, 20*1000), c(20, 1000)))

  for (i in seq(1, 999, 2)){
    df[i] <- rnorm(20, 5, 2)
    df[i+1] <- 5 + 2*df[i] + rnorm(20, 0, 5)
  }


  counter <- reactiveValues(j = 3) #define the counter j as a reactiveValue (stored in the list "counter")

  observeEvent(input$new, { #dynamically update counter j, handle j > 999
    if (counter$j > 999){
      counter$j <- 3
    } else {
      counter$j <- (counter$j + 2)
    }
  })


  output$sample <- renderPlotly({

    #Plot

    plot_ly() %>%
      add_markers(x = df[[counter$j]], y = df[[counter$j+1]],
                  opacity = 1, marker = list(color = 'blue'),
                  name = "Current Draw") %>%
      add_markers(x = df[[counter$j-2]], y = df[[counter$j-1]],
                  opacity = .25, marker = list(color = 'blue'),
                  name = "Past Draw") %>%
      add_lines(x = mean(df[[counter$j]]), y = c(0, 30), name = "Current Mean(x)", line = list(color = 'green')) %>%
      add_lines(x = mean(df[[counter$j-2]]), y = c(0, 30), name = "Past Mean(x)", opacity = .25, line = list(color = 'green')) %>%
      add_lines(y = mean(df[[counter$j+1]]), x = c(-1, 10), name = "Current Mean(y)", line = list(color = 'pink')) %>%
      add_lines(y = mean(df[[counter$j-1]]), x = c(-1, 10), name = "Past Mean(y)", opacity = .25, line = list(color = 'pink')) %>%
      layout(title = "Draw of n = 20 Observations From the Population",
             xaxis = list(range = c(-1, 10), showgrid = FALSE, title = "X"),
             yaxis = list(range = c(0, 30), showgrid = FALSE, title = "Y"))
  })
}

shinyApp(ui = ui, server = server)

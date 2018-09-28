library(datasauRus)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(sliderInput(inputId = "dataset", label = "Dataset:", min = 1, max = 13, value = 1, step = 1)),
  fluidRow(plotOutput("dino"))
)

server <- function(input, output){
  output$dino <- renderPlot({
    #Plotting function
    dz <- datasaurus_dozen

    plot_dino <- function(i){
      plot(y~x, dz[dz$dataset == unique(dz$dataset)[i], ],
           pch = 21, bg = "blue", cex = 1,asp=1,
           ylim = c(0, 100),
           main = paste0('DataSet ', i))
      abline(lm(formula = y~x, data = dz[dz$dataset == "dino", ]), col = 'red',lw=2)
      text("cor(x, y) = -0.06412835", x = 0, y = 0)
    }

    plot_dino(input$dataset)

  })
}

shinyApp(ui = ui, server = server)


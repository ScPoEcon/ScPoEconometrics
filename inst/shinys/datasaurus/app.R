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
           col = "royalblue", pch = 21, bg = "blue", cex = 1, asp=1,
           ylim = c(0, 100), xlim = c(-100, 200), 
           main = paste0('DataSet', i))
      abline(lm(formula = y~x, data = dz[dz$dataset == "dino", ]), col = 'green')
    }
    
    plot_dino(input$dataset)
    
  })
}

shinyApp(ui = ui, server = server)


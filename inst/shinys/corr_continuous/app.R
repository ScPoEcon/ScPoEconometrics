library(mvtnorm)


ui <- fluidPage(
  br(),
  br(),
  sliderInput("c", "Correlation r", min = -1, max = 1, step = .05, value = 0),

  plotOutput("corrPlot"))

server <- function(input,output){
  output$corrPlot <- renderPlot({
    set.seed(10)
    cor = input$c
    sig = matrix(c(1,cor,cor,1),c(2,2))
    ndat = data.frame(rmvnorm(n=300,sigma = sig))
    x = ndat$X1
    y = ndat$X2
    par(pty="s")
    plot(x ~ y, xlab="x",ylab="y",
         xlim = c(-4, 4), ylim = c(-4, 4),
         main = paste0("Correlation: ", cor),
         col = "royal blue")
  })
}

shinyApp(ui = ui, server = server)

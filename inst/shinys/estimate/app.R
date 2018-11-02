#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Estimating 100 Sample Means"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         sliderInput("ssize",
                     "Each Sample has size N:",
                     min = 2,
                     max = 250,
                     value = 5)
      ),

      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot3"),
         fluidRow(
           column(8, align="center",
                  tableOutput("estTable")
           )
         )

      )
   )
   # fluidRow(
   #   column(4,
   #          wellPanel(
   #            sliderInput("ssize", "Sample Size N", min = 2, max = 500, value = 5)
   #          )
   #   ),
   #   column(4,
   #          plotOutput("distPlot3")
   #   ),
   #   column(4,
   #          tableOutput("estTable")
   #   )
   # )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  x <- reactive({
    set.seed(2)
    s = replicate(n = 100,rnorm(n=input$ssize,mean=170,sd=20))
    colMeans(s)
  }
  )

  output$distPlot3 <- renderPlot({
    d = x()
    # hist(d,col = 'darkgray', border = 'white',freq=FALSE,main=paste0("Mean Estimates with N = ",input$ssize),xlim=c(3,7),breaks=20)
    plot(density(d),col="red",xlim=c(140,200),main=paste0("Mean Estimates with N = ",input$ssize),xlab="location of mean estimates",lwd=3)
    rug(d)

  })
  output$estTable <- renderTable({
    data.frame(parameter=c("Median","SD","Range"),estimate=c(round(median(x()),4),round(sd(x()),4),paste(round(range(x()),4),collapse = ",")))},striped=TRUE)
}

# Run the application
shinyApp(ui = ui, server = server)


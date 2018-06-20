library(dplyr)
library(plotly)

ui <- fluidPage(
  br(),
  br(),
  fluidRow(
    
    column(width = 3,
           sliderInput("corr_x1x2", "Correlation(x1, x2)", min = 0,
                       max = 1, step = .25, value = 0),
           br(),
           br(),
           
           textOutput("standarderrors")),
    
    column(width = 9,
           plotlyOutput("planefit"))
    
))

server <- function(input,output){
  
}
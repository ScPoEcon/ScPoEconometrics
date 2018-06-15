library(dplyr)
library(plotly)
library(shiny)

ui <- fluidPage(
  checkboxInput("withdummy", "Allow for gender-specific intercepts!", value = F),
  plotlyOutput("plotdummy"))

server <- function(input,output){
  output$plotdummy <- renderPlotly({
    
    set.seed(19)
    x <- runif(200, min = 18, max = 60)
    sex <- rbinom(200, size = 1, prob = .5)
    y <- -.01*x^2 + 2.523*x - 26.636 + sex*(-10) + rnorm(200, mean = 0, sd = 6)
    
    data <- data.frame(age = x,
                       gender = sex,
                       income = y)
    data$sex[data$gender == 1] = "Woman"
    data$sex[data$gender == 0] = "Man"
    
    if (input$withdummy == F){
      fit <- lm(income ~ age, data = data)
      plot_ly(x = data$age, y = data$income) %>%
        add_markers(name = "Observations",
                    alpha = 0.75, hoverinfo = "skip") %>%
        add_lines(x = data$age, y = fitted(fit), line = list(color = 'black'),
                  name = "Fit(Pooled)", inherit = F, showlegend = T) %>%
        layout(title = 'Pooled Regression',
               xaxis = list(title = 'Age'),
               yaxis = list(title = 'Income'))
    } else {
      fit_2 <- lm(income ~ age + sex, data = data)
      plot_ly(x = data$age, y = data$income) %>%
        
        add_markers(color = data$sex, name = data$sex,
                    alpha = 0.85, hoverinfo = "skip", colors = c('cadetblue1', 'yellow')) %>%
        
        add_lines(x = data[data$gender == 0, "age"],
                  y = fitted(fit_2)[data$gender == 0], line = list(color = 'blue'),
                  name = "Fit(Men)", inherit = F, showlegend = T) %>%
        
        add_lines(x = data[data$gender == 1, "age"],
                  y = fitted(fit_2)[data$gender == 1], line = list(color = 'orange'),
                  name = "Fit(Women)", inherit = F, showlegend = T) %>%
        
        
        layout(title = 'Allowing for gender-specific intercepts.',
               xaxis = list(title = 'Age'),
               yaxis = list (title = 'Income'))
    }  
  })
}

shinyApp(ui = ui, server = server)
library(plotly)

ui <- fluidPage(sidebarLayout(
  
  sidebarPanel(
    sliderInput("n", "Number of Simulations", min = 1, max = 500, value = 10),
    textOutput("percent_well")),
  
  mainPanel(plotlyOutput("ci"))
  
))


server <- function(input,output){
  set.seed(5)
  mean_x <- 20
  
  samples = matrix(nrow = 500, ncol = 4)
  for (i in 1:500){
    sample <- rnorm(1000, mean_x, 10)
    samples[i, 1] <- mean(sample)
    samples[i, 2] <- sd(sample)
  }
  
  samples[, 3] <- samples[, 1] - 1.96*(samples[, 2]/sqrt(1000))
  samples[, 4] <- samples[, 1] + 1.96*(samples[, 2]/sqrt(1000))
  
  samples <- data.frame(samples)
  colnames(samples) <- c("s_mean", "s_sd", "ci_low", "ci_up")
  samples$height <- 1:500
  
  samples$contains <- (samples$ci_low <= mean_x)&(samples$ci_up >= mean_x)
  
  
  output$percent_well <- renderText({
    
    paste0("Proportion Containing: ", (sum(samples$contains[1:input$n])/input$n)*100, "%")
    
  })
  
  
  output$ci <- renderPlotly({
    
    i <- input$n
    p <- plot_ly() %>%
      add_lines(x = mean_x, y = c(0, i+1), name = "True Mean of X") %>%
      
      add_markers(x = samples[i, "ci_low"], y = samples[i, "height"],
                  marker = list(color = 'green'), showlegend = F) %>%
      add_markers(x = samples[i, "ci_up"], y = samples[i, "height"],
                  marker = list(color = 'green'), showlegend = F) %>%
      add_lines(x = c(samples[i, "ci_low"], samples[i, "ci_up"]), y = i,
                name = "95% CI",
                line = list(color = 'green'),
                opacity = .75) %>%
      
      add_markers(x = samples[1:i, "ci_low"], y = samples[1:i, "height"],
                  marker = list(color = 'grey'),
                  showlegend = F, opacity = .5) %>%
      add_markers(x = samples[1:i, "ci_up"], y = samples[1:i, "height"],
                  marker = list(color = 'grey'),
                  showlegend = F, opacity = .5) %>%
      
      layout(title = paste0("Simulation of N = ", i, " CI"),
             xaxis = list(range=c(18, 22), title = "Confidence Interval for the Mean of X"),
             yaxis = list(range=c(0, i+1), zeroline = FALSE, title = "Simulation"))
    
    for (j in 1:i){
      if (samples$contains[j] == T){
        p <- p %>% add_lines(x = c(samples[j, "ci_low"], samples[j, "ci_up"]), y = j,
                             name = "95% CI", opacity = .35,
                             showlegend = FALSE, line = list(color = 'green'))
      } else {
        p <- p %>% add_lines(x = c(samples[j, "ci_low"], samples[j, "ci_up"]), y = j,
                             name = "95% CI", opacity = .35,
                             showlegend = FALSE, line = list(color = 'red'))
      }
    }  
    p
    
  })
}

shinyApp(ui = ui, server = server)
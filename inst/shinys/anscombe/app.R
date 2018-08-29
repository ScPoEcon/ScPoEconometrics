ui <- fluidPage(
  br(),
  br(),
  fluidRow(column(12, align = 'center', checkboxGroupInput(inputId = "addr", label = "Show:",
                              choices = list("Line of Best Fit   " = 1,
                                             "Means              " = 2,
                                             "Standard Deviations" = 3,
                                             "r coefficient      " = 4)))),
  fluidRow(plotOutput("quartet"))
)

server <- function(input,output){
  output$quartet <- renderPlot({
    #Plotting function
    plot_quartet <- function(mean = FALSE, sd = FALSE, fit = FALSE, r = FALSE){
      ff <- y ~ x
      mods <- setNames(as.list(1:4), paste0("lm", 1:4))
      for(i in 1:4){
        ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
        mods[[i]] <- lmi <- lm(ff, data = anscombe)
      }

      op <- par(mfrow = c(2, 2), mar = 0.1+c(4,4,1,1), oma =  c(0, 0, 2, 0))
      for(i in 1:4) {
        ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
        plot(ff, data = anscombe, col = "royalblue", pch = 21, bg = "blue", cex = 1.2,
             xlim = c(3, 19), ylim = c(3, 13), main=paste("dataset",i))

        if (fit == TRUE){
          abline(mods[[i]], col = "green")
        }

        if (mean == TRUE){
          abline(h = mean(anscombe[[paste0("y", i)]]), lty = "dashed")
          abline(v = mean(anscombe[[paste0("x", i)]]), lty = "dashed")
        }

        if (sd == TRUE){
          text(x = 5.5, y = 11,
               labels = paste0("sd_y = ", round(sd(anscombe[[paste0("y", i)]]), 2)),
               cex = 1.1)
          text(x = 5.5, y = 9.5,
               labels = paste0("sd_x = ", round(sd(anscombe[[paste0("x", i)]]), 2)),
               cex = 1.1)
        }

        if (r == TRUE){
          text(x = 15, y = 5,
               labels = paste0("r = ", round(cor(anscombe[[paste0("y", i)]],
                                                 anscombe[[paste0("x", i)]]), 2)),
               cex = 1.1)
        }

      }
      par(op)
    }
    # Plot

    f <- 1 %in% input$addr
    m <- 2 %in% input$addr
    s <- 3 %in% input$addr
    r <- 4 %in% input$addr

    plot_quartet(mean = m, sd = s, fit = f, r = r)

  })
}

shinyApp(ui = ui, server = server)

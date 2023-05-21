#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load the necessary packages

library(shiny)
library(shinythemes)

Data = readRDS("my_save1.rds")
aRMSE = Data$aRMSE
aQLIKE = Data$aQLIKE
aMAE = Data$aMAE
mRMSE = Data$mRMSE
mQLIKE = Data$mQLIKE
mMAE = Data$mMAE
# Define UI for app
ui <- fluidPage(#theme = shinytheme("cyborg"),
  titlePanel("Average & Median MAE Accuracy Comparison"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Accuracy_measurement_average", label = "Choose a measurement (Average):",
                  choices = c("Average RMSE", "Average QLIKE", "Average MAE")),
      selectInput(inputId = "Accuracy_measurement_median", label = "Choose a measurement (Median):",
                  choices = c("Median RMSE","Median QLIKE","Median MAE")),
      textOutput(outputId = "explanation")
      #numericInput(inputId = "number", label = "", value = , min = , max = )
    ),
    mainPanel(
      plotOutput(outputId = "plot1"),
      plotOutput(outputId = "plot2")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  
  output$plot1 <- renderPlot({
    if (input$Accuracy_measurement_average == "Average RMSE") {
      aRMSE
    } else if (input$Accuracy_measurement_average == "Average QLIKE") {
      aQLIKE
    } else if (input$Accuracy_measurement_average == "Average MAE") {
      aMAE
    }
  })
  
  output$plot2 <- renderPlot({
    if (input$Accuracy_measurement_median == "Median RMSE") {
      mRMSE
    } else if (input$Accuracy_measurement_median == "Median QLIKE") {
      mQLIKE
    } else if (input$Accuracy_measurement_median == "Median MAE") {
      mMAE
    } 
  })
  output$explanation <- renderText({
    "After comparison, we discover that ARMA-GARCH is the most accurate method, with performing a lowest score in all measurements."
  })
 # output$numeric_plot <- 
  }

# Run the app
shinyApp(ui, server)



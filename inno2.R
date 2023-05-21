#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# name 3 model names(knn_graph, svm_graph, ran_graph, model_graph) model_graph is the only line graph, others are heatmaps

# Add this at the bottom of rmd file
# my_save2 = list(knn_graph = knn_graph, svm_graph = svm_graph, ran_graph = ran_graph, model_graph = model_graph)
# saveRDS(my_save2,"my_save2.rds")

Data = readRDS("my_save2.rds")
knn_graph = Data$knn_graph
svm_graph = Data$svm_graph
ran_graph = Data$ran_graph
model_graph = Data$model_graph
make_prediction = Data$make_prediction
list_5 = Data$list_5
list_11 = Data$list_11
list_16 = Data$list_16
list_31 = Data$list_31
list_62 = Data$list_62

# Define UI for app
ui <- fluidPage(theme = shinytheme("cyborg"),
  titlePanel("Different models' heatmaps"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "model", label = "Choose a model",
                  choices = c("KNN Model", "SVM Model", "Random Forest Model")),
      #numericInput(inputId = "prediction", label = "Input a time bucket",value = 1, min = 1, max = 600),
      numericInput(inputId = "number", label = "Input a fluctuation integer", value = 1, min = 0, max = 16),
      selectInput(inputId = "model_2", label = "Choose a time_id",
                  choices = c("5","11","16","31","62"))
      
    ),
    mainPanel(
      plotOutput(outputId = "plot1", width = "90%", height = "300px"),
      plotOutput(outputId = "plot2", width = "90%", height = "300px"),
      verbatimTextOutput(outputId = "prediction"),
      verbatimTextOutput(outputId = "numeric_output")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  
  output$plot1 <- renderPlot({
    if (input$model == "KNN Model") {
      knn_graph
    } else if (input$model == "SVM Model") {
      svm_graph
    } else if (input$model == "Random Forest Model") {
      ran_graph
    }
  })
  
  output$plot2 <- renderPlot({
    model_graph
  })
  
  output$prediction <- renderText({
    if (input$model_2 == "5"){
      paste("Estimated Accuracy:",list_5[1,1],"\nPredicted trend:",list_5[1,2],"\nPredicted Volatility:",list_5[1,3])
    } else if (input$model_2 == "11"){
      paste("Estimated Accuracy:",list_11[1,1],"\nPredicted trend:",list_11[1,2],"\nPredicted Volatility:",list_11[1,3])
    } else if (input$model_2 == "16"){
      paste("Estimated Accuracy:",list_16[1,1],"\nPredicted trend:",list_16[1,2],"\nPredicted Volatility:",list_16[1,3])
    } else if (input$model_2 == "31"){
      paste("Estimated Accuracy:",list_31[1,1],"\nPredicted trend:",list_31[1,2],"\nPredicted Volatility:",list_31[1,3])
    } else if (input$model_2 == "62"){
      paste("Estimated Accuracy:",list_62[1,1],"\nPredicted trend:",list_62[1,2],"\nPredicted Volatility:",list_62[1,3])
    }
  })

  
  output$numeric_output <- renderPrint({
    if (input$number <= 11 & input$number > 0) {
      "You need to choose knn as the model."
    } else if (input$number > 11){
      "You should choose random forest as the model."
    } else{
      "This is not a valid input."
    }
  })
  
  # output$numeric_plot <- 
}

# Run the app
shinyApp(ui, server)
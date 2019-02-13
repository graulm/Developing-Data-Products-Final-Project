library(shiny)
library(ggplot2); library(caret); library(rpart); library(rattle)
library(plotly)
library(e1071)
data("iris")
shinyServer(function(input, output) {
        
        treeModel <- train(Species ~ .,method="rpart",data=iris)
        
        output$plot2 <- renderPlot({
                
                new_data <- data.frame("Sepal.Length" = input$sepalLength, "Sepal.Width" = input$sepalWidth, "Petal.Length" = input$petalLength, "Petal.Width"= input$petalWidth) 
                user_pred <- predict(treeModel,newdata=new_data)
                output$out2 <- renderText(as.character(user_pred))
                
                ggplot(iris, aes(Sepal.Length, Sepal.Width, col=Species)) + geom_point(size = 2) +
                geom_point(aes(input$sepalLength,input$sepalWidth), color="black", size=4)  
        })
        
        output$tree1 <- renderPlot({
                fancyRpartPlot(treeModel$finalModel) 
        })
        
        output$summaryModel <- renderPrint({
                treeModel
        })
        
})
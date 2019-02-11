library(ggplot2); library(caret); library(rpart); library(rattle)

data("iris")
dim(iris)
head(iris)

treeModel <- train(Species ~ .,method="rpart",data=iris)
fancyRpartPlot(treeModel$finalModel)

new_data <- data.frame("Sepal.Length" = 3.2, "Sepal.Width" = 4.5, "Petal.Length" = 1.3, "Petal.Width"= 0.4) 
user_pred <- predict(treeModel,newdata=new_data)
user_pred

treeModel

ggplot(iris, aes(Sepal.Length, Sepal.Width, col=Species)) + geom_point(size = 2) + geom_point(aes(6,4), color="black", size=4) 

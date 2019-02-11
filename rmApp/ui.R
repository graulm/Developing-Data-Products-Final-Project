library(shiny)
shinyUI(fluidPage(
        titlePanel("Predicted Flower Species"),
        sidebarLayout(
                sidebarPanel(
                        h3(""),
                        h3("Instruction"),
                        p("To predict the species of a flower, enter the dimensions using the sliders. Then click on the 'Submit' button."),
                        sliderInput("sepalLength", "Sepal Length?", min(iris$Sepal.Length), max(iris$Sepal.Length), value = mean(iris$Sepal.Length)),
                        sliderInput("sepalWidth" , "Sepal Width?" , min(iris$Sepal.Width), max(iris$Sepal.Width), value = mean(iris$Sepal.Width)),
                        sliderInput("petalLength", "Petal Length?", min(iris$Petal.Length), max(iris$Petal.Length), value = mean(iris$Petal.Length)),
                        sliderInput("petalWidth" , "Petal Width?" , min(iris$Petal.Width), max(iris$Petal.Width), value = mean(iris$Petal.Width)),
                        submitButton("Submit")
                        
                ),
                mainPanel(
                        
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Data Plot", br(), 
                                             plotOutput("plot2"),
                                             h4("Predicted Flower Species:"),textOutput("out2")
                                             
                                             ), 
                                    tabPanel("Tree Model", br(), 
                                             plotOutput("tree1")
                                             ),
                                    tabPanel("Summary", br(),
                                             
                                             verbatimTextOutput("summaryModel")
                                    )
                        )
                        
                )
        )
))
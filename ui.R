library(shiny)
library(car)
library(ggplot2)
shinyUI(fluidPage(
    titlePanel("Predict Prestige Score using Income and Education"),
    sidebarLayout(
        sidebarPanel( #Input
            sliderInput("slideredu", "What is the average Year of Education?", 5, 30, value = 9), 
            sliderInput("sliderincome", "What is the average Income?", 500, 30000, value = 5000), 
            checkboxInput("showIncome", "Show/Hide Income", value = TRUE),
            checkboxInput("showEducation", "Show/Hide Education", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel( #Output
            plotOutput(outputId="plot1", width="700px",height="500px"),
            h3("Predicted Prestige Score from model:"),
            textOutput("pred1")
        )
    )
))

library(shiny)
library(car)
library(gridExtra)

shinyServer(function(input, output) {
    model <- lm(prestige ~ education + log(income), data = Prestige)
    
    modelpred <- reactive({
        eduInput <- input$slideredu
        incomeInput <- input$sliderincome
        predict(model, newdata = data.frame(education = eduInput,
                                            income = incomeInput))
    })
    
    pt1 <- reactive({
        if(!input$showIncome) return(NULL)
        qplot(income, prestige, data = Prestige, xlab = "Average Income",
              ylab = "Prestige Score") + 
        geom_point(data= data.frame(income = input$sliderincome,
                                    prestige = modelpred()),
                                    colour="red", size = 4, shape =8)   
    })
    
    pt2 <- reactive({ 
        if(!input$showEducation) return(NULL)
        qplot(education, prestige, data = Prestige, xlab = "Years of Education",
              ylab = "Prestige Score") +
        geom_point(data= data.frame(education = input$slideredu,
                                        prestige = modelpred()), 
                                        colour="red", size = 4, shape =8)       
    })
    
        output$plot1 <- renderPlot({
            ptlist <- list(pt1(),pt2())
            #remove the null plots from ptlist and wtlist
            to_delete <- !sapply(ptlist,is.null)
            ptlist <- ptlist[to_delete] 
            if (length(ptlist)==0) return(NULL)
            
            grid.arrange(grobs=ptlist, nrow=length(ptlist))
        })
        
        output$pred1 <- renderText({
            modelpred()
        })
})
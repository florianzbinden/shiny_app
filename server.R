library(shiny)
library(ggplot2)
data(swiss)
fit_lm <- lm(Agriculture  ~ Examination, data = swiss)
Ag_pred <- function(Examination){unname(round(predict(fit_lm, newdata=data.frame(Examination=Examination)),0))}
swiss <- suppressWarnings(data.frame(swiss, predict(fit_lm, interval="prediction")))

shinyServer(
    function(input, output) {
      
      output$Examination <- renderPrint({input$Examination})
      output$Agriculture <- renderPrint(Ag_pred(input$Examination))
      
        output$p2 <- renderPlot({
          
            p2 <- ggplot(swiss,aes(x=Examination, y=Agriculture)) +
                geom_ribbon(aes(ymin=lwr,ymax=upr,fill='prediction'),alpha=0.3) +
                geom_smooth(method="lm",aes(fill='confidence'),alpha=0.3) +
                geom_smooth(method="lm",se=FALSE,color='blue') +
                geom_point() +
                geom_vline(xintercept=c(input$Examination, input$Examination), linetype=1, colour = "red", size = 2) +
                ggtitle ("Swiss dataset: Agriculture vs Examination") +
                scale_fill_manual('Interval', values = c('green', 'yellow')) +
                coord_cartesian(ylim = c(0, 100), xlim =c(min(swiss$Examination), max(swiss$Examination))) +
                xlab("Examination") +  ylab ("Agriculture")
            
                    print(p2)  
        })
    }
)



library(shiny)

# Define server logic required to plot data and add linear fit and cor coef
function(input, output, session) {

    output$airPlot <- renderPlot({
    	
    	cor_coef <- cor(airquality[[input$xvar]], airquality[[input$yvar]], use = "complete.obs")
    	cor_coef <- round(cor_coef, 2)
    	
        # draw the data with the chosen x variable and y variable
        fig <- ggplot(airquality, aes(x = !!input$xvar, y = !!input$yvar)) +
        	geom_point()
        
        # add linear fit if relevant box is checked
        if (input$show_lm) {
        	fig <- fig + geom_smooth(method = "lm",
        				 se = FALSE,
        				 color = "red")
        }
        
        # add text box with correlation coefficient if relevant box is checked
        if (input$show_cor) {
        	fig <- fig + annotate(
        		"label",
        		x = 0.8 * max(airquality[[input$xvar]], na.rm = TRUE),
        		y = 0.95 * max(airquality[[input$yvar]], na.rm = TRUE),
        		label = paste0("Correlation: ", cor_coef),
        		size = 7
        	)
        }
        
        fig

    })

}


library(shiny)
library(datasets)
library(ggplot2)
library(ggfortify)

	
# Define UI for application
fluidPage(

    # Application title
    titlePanel("Explore air quality measurements in New York"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            varSelectInput("xvar",
                        "Chose the x-variable:",
                        airquality,
                        selected = "Ozone"),
            varSelectInput("yvar",
            	       "Chose the y-variable:",
            	       airquality,
            	       selected = "Wind"),
            checkboxInput("show_lm", "Show linear fit", FALSE),
            checkboxInput("show_cor", "Show correlation coefficient", FALSE)
        ),

        mainPanel(
        	p(
        		"With this App you can explore a dataset about air quality measurements in New York from May to September 1973. It is part of the R-package 'datasets'."
        	),
        	p(
        		"Choose the different variables to be displayed in the plot and choose wether a linear fit should be drawn and the correlation coefficient between the chosen variables should be shown."
        	),
        	plotOutput("airPlot")
        )
    )
)

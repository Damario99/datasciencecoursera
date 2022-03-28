#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Capstone"),
    h5("March 27, 2022"),
    h5("Wait for the data to load"),
    
    mainPanel(
        textInput("textIn", 
                  label = h3("Text input: "), 
                  value = ""),
        h3("Text output: "),
        textOutput("textOut"),
        h3("Source code: "),
        h5("https://github.com/Damario99/datasciencecoursera")
    )
)
)

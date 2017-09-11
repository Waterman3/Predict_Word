#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Predict the next word given a string of words.
shinyUI(fluidPage(
  
  # Application title
  titlePanel("What's the next word?"),
  
   mainPanel(
       h3("Please type some words, then press the Ready button. I will predict the next one:"),
       textInput("initial_string",""),
       actionButton("readyButton","Ready"),
       h3("The next word is:"),
       textOutput("pred"),
       textOutput("tryagain")
    )
  )
)

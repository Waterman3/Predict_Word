
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(data.table)
library(tidytext)
library(stringr)

source("last_n_words.R")
source("first_n_words.R")
source("find_last_word.R")

# Define server logic required to predict the next word given a phrase.

# Load n-grams from disk

 load("train2_bigrams_start_dt")
 load("train2_trigrams_start_dt")
 load("train2_quadgrams_start_dt")


shinyServer(function(input, output) {
 
    pred<-eventReactive(input$readyButton, {
        instring<-input$initial_string
        predict_last_word(instring)
      })
    
    tryagain<-eventReactive(input$readyButton, {
      return("To try again please push the reload button on right of the buttons at the top of this screen.")
    })
      

  output$pred <- renderText({
  pred()  })
  
  output$tryagain <- renderText({
    tryagain()
  })
})

 
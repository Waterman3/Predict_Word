
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

train2_bigrams_start_dt<-readRDS("train2_bigrams_start_dt.rds")
train2_trigrams_start_dt<-readRDS("train2_trigrams_start_dt.rds")
train2_quadgrams_start_dt<-readRDS("train2_quadgrams_start_dt.rds")

setkey(train2_bigrams_start_dt, start)
setkey(train2_trigrams_start_dt, start)
setkey(train2_trigrams_start_dt, start)

# Define server logic required to predict the next word given a phrase.


shinyServer(function(input, output) {
        pred<-eventReactive(input$readyButton, {
        instring<-input$initial_string
        predict_last_word(instring)
      })
    
    tryagain<-eventReactive(input$readyButton, {
      return("To try again type new text in the box above and push Ready.")
    })
      

  output$pred <- renderText({
  pred()  })
  
  output$tryagain <- renderText({
    tryagain()
  })
})

 
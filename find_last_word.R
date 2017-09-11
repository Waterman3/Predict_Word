predict_last_word <- function(input_string) {
  # Function that give some text with the last word missing, will return the word that it predicts will be the last word.
  
 # library(stringr)
  #library(tidytext)
  #library(dplyr)
  
  stlength<-str_count(input_string, boundary("word"))
  
  
  #if (stlength >= 6) 
   #{ 
    #  teststring <- tolower(last_n_words(input_string, 6))
     # last_word<-get_last_word(teststring, train_all_septgrams_prob_dt)
#      if (stlength >= 5)
#       {
#          teststring <- tolower(last_n_words(input_string, 5))
#          last_word<-get_last_word(teststring, train2_sexgrams_prob_dt)
#          if (is.null(last_word))
#            {
#	            teststring <- tolower(last_n_words(input_string, 4))
#	            last_word<-get_last_word(teststring, train2_quingrams_prob_dt)
#	            if (is.null(last_word))
              if (stlength >= 4)
	              {
	                teststring <- tolower(last_n_words(input_string, 3))
	                last_word <- get_last_word(teststring, train2_quadgrams_start_dt)
	               
	                if (is.null(last_word))
        	           {
	                      teststring <- last_n_words(input_string, 2)
	                      last_word <- get_last_word(teststring, train2_trigrams_start_dt)
	                      if (is.null(last_word))
	                        {
	                          teststring <- last_n_words(input_string,1)
	                          last_word <- get_last_word(teststring, train2_bigrams_start_dt)
	                        }
	                }
              }
#	                }
#              }
#         }
  else
    {
        if (stlength == 3) 
	        {
	          teststring <- last_n_words(input_string, 3)
		        last_word<-get_last_word(teststring, train2_quadgrams_start_dt) 
           }
	      else
	        {
		        if (stlength == 2)
		          {
			          teststring <- last_n_words(input_string, 2)
			          last_word<-get_last_word(teststring, train2_trigrams_start_dt)
		          }
		      else
		          {
		            if (stlength == 1)
		              {
			              teststring <- last_n_words(input_string, 1)
			              last_word <- get_last_word(teststring, train2_bigrams_start_dt)
		              } 
	            }
	        }
    }
  return(last_word)
}

get_last_word <- function(instring, ngram_prob) {
    #Function to return the last word of an ngram of the specified type that has the highest probability of occurring given
    #that it starts witn the words in instring, or NULL if the phrase in instring cannot be found.
    #If two ngrams have equal probability or occurring the one occurring at the top
    #of a sorted data.table will be returned.

    
    search_string<-instring
    
#    select_phrases<- ngram_prob[grepl(search_string, gram),]
#   top_phrases<- select_phrases[order(-prob)]
   
     
    
    top_phrases<-ngram_prob[start==search_string,.(gram,prob)][order(-prob)][1]$gram
    
    if (is.na(top_phrases))
	     {
	      return("Sorry. I can't predict this word.")
	      }
    else
	    {
	      final_word<-last_n_words(top_phrases,1)
	      return(final_word)
      }
  }

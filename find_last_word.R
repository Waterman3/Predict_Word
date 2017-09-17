predict_last_word <- function(input_string) {
  # Function that give some text with the last word missing, will return the word that it predicts will be the last word.
  
 # library(stringr)
  #library(tidytext)
  #library(dplyr)
  
  train2_bigrams_start_dt<-readRDS("train2_bigrams_start_dt.rds")
  train2_trigrams_start_dt<-readRDS("train2_trigrams_start_dt.rds")
  train2_quadgrams_start_dt<-readRDS("train2_quadgrams_start_dt.rds")
  
  stlength<-str_count(input_string, boundary("word"))
  
  setkey(train2_bigrams_start_dt, start)
  setkey(train2_trigrams_start_dt, start)
  setkey(train2_trigrams_start_dt, start)
  if (stlength >= 4)
      {
          teststring <- tolower(last_n_words(input_string, 3))
          last_word <- get_last_word(teststring, train2_quadgrams_start_dt)
          if (is.null(last_word))
	           {
                teststring <- tolower(last_n_words(input_string, 2))
                print("At 4.2 teststring is")
                print(teststring)
                last_word <- get_last_word(teststring, train2_trigrams_start_dt)
                if (is.null(last_word))
                    {
                      teststring <- tolower(last_n_words(input_string,1))
                      last_word <- get_last_word(teststring, train2_bigrams_start_dt)
                      if (is.null(last_word))
                      {
                        last_word <- "Sorry. I can't predict the last word."
                      }
                    }
                }                
          }
      else
        {
          if (stlength == 3) 
	        {
            teststring <- tolower(last_n_words(input_string, 3))
            last_word<-get_last_word(teststring, train2_quadgrams_start_dt) 
            if (is.null(last_word))
               {
                  teststring <- tolower(last_n_words(input_string, 2))
                  last_word <- get_last_word(teststring, train2_trigrams_start_dt)
                  if (is.null(last_word))
                    {
                      teststring <- tolower(last_n_words(input_string,1))
                      last_word <- get_last_word(teststring, train2_bigrams_start_dt)
                      if (is.null(last_word))
                        {
                          last_word <- "Sorry. I can't predict the last word."
                        }
                    }
                }
             }  
  	      else
	          {
		          if (stlength == 2)
		            {
			            teststring <- tolower(last_n_words(input_string, 2))
			            last_word<-get_last_word(teststring, train2_trigrams_start_dt)
		              if (is.null(last_word))
	                  {
	                  teststring <- tolower(last_n_words(input_string,1))
	                  last_word <- get_last_word(teststring, train2_bigrams_start_dt)
        	          if (is.null(last_word))
	                    {
	                        last_word <- "Sorry. I can't predict the last word."
        	            }
		              }
		          }
		        else
		          {
		            if (stlength == 1)
		              {
			              teststring <- tolower(last_n_words(input_string, 1))
			              last_word <- get_last_word(teststring, train2_bigrams_start_dt)
		                if (is.null(last_word))
		                    {
		                      last_word <- "Sorry. I can't predict the last word."
		                    }
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
	      return(NULL)
	      }
    else
	    {
	      final_word<-last_n_words(top_phrases,1)
	      return(final_word)
      }
  }

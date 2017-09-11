last_n_words <- function(input_string, n=5) {
  # Function to extract as a string, the last n words in the input_string.
  
  library(stringr)
  
  int_words<- str_extract_all(input_string, boundary("word"))
  stlength<-str_count(input_string, boundary("word"))
  output_string<-""
  
  if (n==1) {
    output_string<-int_words[[1]][stlength]
  }
  else
  {
    for ( i in (stlength-n+1):stlength) {
    output_string<-str_trim(paste(output_string, int_words[[1]][i]), "left")
    }
  } 
  return(output_string)
}
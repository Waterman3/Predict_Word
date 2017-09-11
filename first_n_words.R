first_n_words <- function(input_string, n=5) {
  # Function to extract as a string, the last n words in the input_string.
  
  library(stringr)
  
  int_words<- str_extract_all(input_string, boundary("word"))
  stlength<-str_count(input_string, boundary("word"))
  output_string<-""
  
  if (n==1) {
    output_string<-int_words[[1]][1]
  }
  else
  {
    for ( i in 1:n) {
    output_string<-str_trim(paste(output_string, int_words[[1]][i]), "right")
    output_string<-str_trim(output_string, "left")
    }
  } 
  return(output_string)
}

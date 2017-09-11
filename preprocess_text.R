preprocess_text<-function(unprocessed_dataset) {
  # Function to convert strip out " and \ from a text dataset, replace .
  # with a space and to convert 
  # upper case to lower case letters.
  # Warwick Taylor
  # 28/08/2017
  
  loweredcase<-tolower(unprocessed_dataset)
  nostop<-gsub("[[:punct:]]", "",loweredcase) 
  stripspeech<-gsub("\"", "", nostop)
  nobackslash<-gsub("\\\\","", stripspeech)
  readytext<-gsub(",","", stripspeech)
  readytext2<-gsub(".","",readytext)
  return(stripspeech)
}
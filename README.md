# Predict_Word

This application predicts the next word given a string of words.

It does so by reading a string of text, taking up to 3 of the last words of that string and trying to match those words with  
the first three words of strings of four words (known as quadrams or 4-grams). If there is a match the last word of the most 
commonly occurring group of four words in the matching strings is returned. If the string provided is only two words long or
there are no groups of four words matching the last three words of the string, the application searches through groups of three
words (trigrams or 3-grams) for a match and returns the last word of the most commonly occurring matching trigram. If the string
is only one word or no matching trigram is found for a longer string the application searches groups of two words (bigrams).
If no matching string is found from the bigrams, the application returns the string, "Sorry. I can't find the next word.".

The application also advises the user to push the reload button if the user wants to use it again.					 
Files are as follows:

* ui.R - user interface R code.

* server.R - server R code.

* first_n_words.R - R code for finding the first n words of a string.

* last_n_words.R - R code for finding the last n words of a string.

* find_last_word.R - R code for predicting the next word given a string.  

* preprocess_text.R - R code for preprocessing text prior to making n-grams. 

* README.md - this file.

Further Development 

The accuracy of prediction is less than 30% when the application was tested against two "quizzes"

To improve this I suggest a couple of approaches.

1.Split each string in the sample text (up to a given maximum number of words) into strings of up to a given length plus the 
last word. Then use some sort of classification method (tree, Random Forest or gradient boosting method) to train a model and 
use the model to predict the next word. Attempts to do this so far have overpowered R or halted my computer. I have not yet tried using hash codes instead of strings. I was going to use the FeatureHashing package to do this but I can't install it.

2. Something based on context is the best way to go. Using word vectors and skip grams is probably the best method. I have trained a model using the wordVectors package (using rword2vec caused stack overflow even for small corpora) but I could not 
progress further due to lack of time.

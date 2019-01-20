


#### nltk--> package Used for natural Language Processing
### Features

punkt :

Download it : nltk.download("punkt")

#### Punkt Setence Tokenizer:

Divides text into list of sentences. Used mailny for english language sentnences 

#### Text Stemming Library
from nltk.stem.porter import PorterStemmer


#### TFIDF Vectorization

Giving importance to a word 

###### formula:

      TF-IDF(t,d,D) = TF(t,d) * IDF(t,D)
      
t = token         d = single document          D = number of documents


      IDF(t) = log(N/count(t))
N = documents
* Here log is compression high range values into smaller range numbers



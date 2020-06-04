//9. Apply Sentiments to Sentences
MATCH (t:Tweet)-[]-(a:AnnotatedText) 
CALL ga.nlp.sentiment(a) YIELD result 
RETURN result
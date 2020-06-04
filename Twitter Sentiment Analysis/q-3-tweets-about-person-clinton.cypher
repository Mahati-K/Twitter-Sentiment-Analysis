//Q3. Tweets about person Clinton
MATCH (:NER_Person {value: 'clintons'})-[]-(s:Sentence)-[]-(:AnnotatedText)-[]-(tweet:Tweet) 
RETURN distinct tweet.text
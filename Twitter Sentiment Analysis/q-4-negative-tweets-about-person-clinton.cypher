//Q4. Negative tweets about Person Clinton
MATCH (:NER_Person {value: 'clintons'})-[]-(s:Sentence:Negative)-[]-(:AnnotatedText)-[]-(tweet:Tweet) 
RETURN distinct tweet.text
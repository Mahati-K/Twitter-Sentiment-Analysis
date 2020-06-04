//Q5. Most frequently negatively tweeted Person
MATCH (tag:NER_Person)-[]-(s:Sentence:Negative)-[]-(:AnnotatedText)-[]-(tweet:Tweet) 
WHERE 
   NOT tag:NER_Organization AND 
   NOT tag:NER_O
RETURN distinct tag.value, count(tweet) as negativeTweets 
ORDER BY negativeTweets DESC
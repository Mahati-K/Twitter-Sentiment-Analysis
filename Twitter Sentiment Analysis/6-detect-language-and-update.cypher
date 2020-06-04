//6. Detect language and update
MATCH (t:Tweet)
CALL ga.nlp.detectLanguage(t.text)
YIELD result
SET t.language = result
RETURN count(t);
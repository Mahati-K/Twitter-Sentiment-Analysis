//Q6. Negative and Positive tweets about organizations
MATCH (t:NER_Organization)-[]-(s:Sentence)
WHERE 
  'Negative' in labels(s) OR 
  'Positive' in labels(s) 
  AND length(labels(t)) = 2 
RETURN distinct t.value as orgName, s.text as sentence, 
       labels(s) as sentiment
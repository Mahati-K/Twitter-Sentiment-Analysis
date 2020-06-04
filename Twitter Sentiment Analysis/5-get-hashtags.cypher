//5. Get Hashtags
MATCH (t:Tweet) 
WHERE t.text =~ ".*#.*" 
WITH 
  t, 
  apoc.text.regexGroups(t.text, "(#\\w+)")[0] as hashtags 
UNWIND hashtags as hashtag
MERGE (h:Hashtag { name: toUpper(hashtag) })
MERGE (h)<-[:hashtag { used: hashtag }]-(t)
RETURN count(h);
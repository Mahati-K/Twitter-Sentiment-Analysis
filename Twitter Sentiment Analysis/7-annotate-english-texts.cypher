//7. Annotate English Texts
MATCH (t:Tweet { language: "en" })
CALL ga.nlp.annotate({text: t.text, id: id(t)})
YIELD result
MERGE (t)-[:HAS_ANNOTATED_TEXT]->(result)
RETURN count(result)
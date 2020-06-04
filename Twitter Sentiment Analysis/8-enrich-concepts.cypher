//8. Enrich Concepts
MATCH (n:Tag)
CALL ga.nlp.enrich.concept({tag: n, depth:2, admittedRelationships:["IsA","PartOf"]})
YIELD result
RETURN count(result);
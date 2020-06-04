//Q2. Most Used Hashtags
match (h:Hashtag)--(t:Tweet) 
return h.name as Hashtag, count(h.name) as Count
order by Count desc
limit 10
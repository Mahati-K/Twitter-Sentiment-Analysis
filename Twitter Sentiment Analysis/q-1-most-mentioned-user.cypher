//Q1. Most Mentioned User
match p=(u:User)--(t:Tweet) 
return u.name as User, count(u.name) as Count
order by Count desc
limit 10
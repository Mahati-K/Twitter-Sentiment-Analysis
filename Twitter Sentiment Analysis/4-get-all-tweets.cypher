//4. Get All Tweets
UNWIND [
 'http://www.trumptwitterarchive.com/data/realdonaldtrump/2019.json',
 'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2018.json',
'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2017.json',
'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2016.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2015.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2014.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2013.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2012.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2011.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2010.json',
  'http://trumptwitterarchivedata.s3-website-us-east-1.amazonaws.com/data/realdonaldtrump/2009.json'
] AS url
CALL apoc.load.json(url) YIELD value as t
MERGE (s:Source { name: t.source })
CREATE (tweet:Tweet {
    id_str: t.id_str,
    text: t.text,
    created_at: t.created_at,
    retweets: t.retweet_count,
    favorites: t.favorite_count,
    retweet: t.is_retweet,
    in_reply: coalesce(t.in_reply_to_user_id_str, '')
})
CREATE (tweet)-[:from]->(s)
RETURN count(t);
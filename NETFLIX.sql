SELECT *
FROM netflix

SELECT
DISTINCT type
FROM netflix;

------Count the number of movies vs TV Shows--
SELECT 
	type,
    COUNT (*) as total_content
FROM netflix
GROUP BY type

------Find the most common rating for the movies and TV shows
	SELECT
	     type,
	     rating
	FROM
	
(SELECT 
	type,
    rating,
	COUNT(*),
	RANK()OVER(PARTITION BY type ORDER BY COUNT(*)) as ranking
FROM netflix
GROUP BY 1,2
) as t1
WHERE ranking = 1

----List all movies released in a specific year (2020)

	
SELECT * FROM netflix
WHERE
	type = 'Movie'
	AND
    release_year = 2020

----Find the top 5 countries with the most content on Netflix

SELECT
	UNNEST(STRING_TO_ARRAY(country,',')) as new_country,
    COUNT(show_id)as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

----Identify the longest movie
SELECT * FROM netflix
WHERE 
    type = 'Movie'
    AND 
    duration = (SELECT MAX(duration)FROM netflix)

---Find the content added in the last 5 years

SELECT * FROM netflix
WHERE 
    TO_DATE(date_added,'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years'

---Find all movies by director 'Rajiv Chilaka'

SELECT * FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%'

---List all Tv shows with more than 5 seasons

SELECT *
	FROM netflix
WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration , ' ',1)::numeric > 5

----Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
	COUNT(show_id)
	
FROM netflix
GROUP BY 1

---Find each year and the average numbers of content release by India on netflix.
---Return top 5 year with highest avg content release

SELECT 
	EXTRACT(YEAR FROM TO_DATE("date_added",   'Month DD,YYYY')) as year,
	COUNT(*) as yearly_content,
	COUNT(*)::numeric/(SELECT COUNT(*)FROM netflix WHERE country = 'India')::numeric * 100 as avg_content_per_year
WHERE country = 'India'
GROUP BY 1

---List all movies that are documentaries

SELECT * FROM netflix
WHERE 
     listed_in ILIKE '%documentaries'

---Find all content without director

SELECT* FROM netflix
WHERE 
     director is NULL

---Find how many movies actor 'Salman Khan'appeared in last 10 years

SELECT* FROM netflix
WHERE 
     casts ILIKE '%Salman Khan%'
     AND
     release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

--Find the top 10 actors who have appeared in the highest number of movies produced in India
SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
	COUNT(*)as total_content
FROM netflix
WHERE COUNTRY ILIKE '%india'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

---Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all the other content as 'Good'.Count how many items fall into each category
WITH new_table
AS
(
SELECT 
*,
      CASE
      WHEN
           description ILIKE '%kill%' OR
           description ILIKE '%violence%' THEN 'Bad_Content'
           ELSE 'Good Content'
      END category
FROM netflix
)  
SELECT 
      category,
      COUNT(*) as total_content
FROM new_table
GROUP BY 1
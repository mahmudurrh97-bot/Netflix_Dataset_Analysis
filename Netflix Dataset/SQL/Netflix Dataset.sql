-- 1. Find the top 10 most common categories (GROUP BY, ORDER BY, LIMIT)
SELECT category, COUNT(*) AS total
FROM netflix_dataset_analysis
GROUP BY category
ORDER BY total DESC
LIMIT 10;

-- 2. Count how many shows were released each year (DATE functions, GROUP BY)
SELECT EXTRACT(YEAR FROM release_date) AS release_year, COUNT(*) AS total_releases
FROM netflix_dataset_analysis
WHERE release_date IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- 3. Find the longest movie duration (numeric extraction from duration text)
SELECT title, duration
FROM netflix_dataset_analysis
WHERE category = 'Movie'
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC
LIMIT 1;

-- 4. List TV Shows that have more than 5 seasons (string filter + casting)
SELECT title, duration
FROM netflix_dataset_analysis
WHERE category = 'TV Show'
  AND duration ILIKE '%Seasons%'
  AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5;

-- 5. Find all titles with the word "love" in description (string search - LIKE, similar to str.contains)
SELECT title, description
FROM netflix_dataset_analysis
WHERE description ILIKE '%love%';

-- 6. Count number of shows by rating (aggregation)
SELECT rating, COUNT(*) AS total
FROM netflix_dataset_analysis
GROUP BY rating
ORDER BY total DESC;

-- 7. Find the country with the highest number of Netflix titles
SELECT country, COUNT(*) AS total
FROM netflix_dataset_analysis
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 1;

-- 8. Find all shows released after 2020 with rating 'TV-MA'
SELECT show_id, title, release_date, rating
FROM netflix_dataset_analysis
WHERE release_date > '2020-01-01' AND rating = 'TV-MA';

-- 9. Window function: Rank movies by duration within each rating group
SELECT title, rating,
       CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) AS minutes,
       RANK() OVER (PARTITION BY rating ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC) AS rank_in_rating
FROM netflix_dataset_analysis
WHERE category = 'Movie';

-- 10. Find average movie duration per release year (GROUP BY + AVG)
SELECT EXTRACT(YEAR FROM release_date) AS release_year,
       AVG(CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER)) AS avg_minutes
FROM netflix_dataset_analysis
WHERE category = 'Movie'
  AND duration ILIKE '%min%'
  AND release_date IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

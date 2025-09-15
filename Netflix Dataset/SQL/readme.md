# 📊 Netflix Dataset Analysis (PostgreSQL)

## Database Creation & Import Process (Summary)
1. **Create Database**: Make a new database in PostgreSQL (e.g., `Netflix Dataset`).  
2. **Create Table**: Define the schema `netflix_dataset_analysis` with columns  
   (`show_id, category, title, director, country, release_date, rating, duration, type, description, date`).  
   Ensure data types are correct (`DATE`, `VARCHAR`, `TEXT`).  
3. **Import Data**: Use `\copy` in pgAdmin/psql to load the CSV (`netflix_dataset_pgadmin_nullsafe.csv`).  
   Make sure empty values in date fields are treated as `NULL`.  
4. **Verify Import**: Run a quick `SELECT * LIMIT 5;` to check that data looks correct.  

---

## SQL Summary Queries
Run the following SQL block to quickly summarize the dataset:

```sql
-- 1. Total records in dataset
SELECT COUNT(*) AS total_records FROM netflix_dataset_analysis;

-- 2. Number of Movies vs TV Shows
SELECT category, COUNT(*) AS total
FROM netflix_dataset_analysis
GROUP BY category;

-- 3. Top 5 most common ratings
SELECT rating, COUNT(*) AS total
FROM netflix_dataset_analysis
GROUP BY rating
ORDER BY total DESC
LIMIT 5;

-- 4. Total titles per year
SELECT EXTRACT(YEAR FROM release_date) AS release_year, COUNT(*) AS total
FROM netflix_dataset_analysis
WHERE release_date IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- 5. Average movie duration (in minutes)
SELECT AVG(CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER)) AS avg_movie_minutes
FROM netflix_dataset_analysis
WHERE category = 'Movie' AND duration ILIKE '%min%';

-- 6. Country with most Netflix titles
SELECT country, COUNT(*) AS total
FROM netflix_dataset_analysis
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 1;

-- 7. Titles containing the word "love" in description
SELECT COUNT(*) AS titles_with_love
FROM netflix_dataset_analysis
WHERE description ILIKE '%love%';

-- 8. Shows released after 2020 with rating 'TV-MA'
SELECT show_id, title, release_date, rating
FROM netflix_dataset_analysis
WHERE release_date > '2020-01-01' AND rating = 'TV-MA';

-- 9. Rank movies by duration within each rating (window function)
SELECT title, rating,
       CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) AS minutes,
       RANK() OVER (PARTITION BY rating ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC) AS rank_in_rating
FROM netflix_dataset_analysis
WHERE category = 'Movie';

-- 10. Average movie duration per release year
SELECT EXTRACT(YEAR FROM release_date) AS release_year,
       AVG(CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER)) AS avg_minutes
FROM netflix_dataset_analysis
WHERE category = 'Movie'
  AND duration ILIKE '%min%'
  AND release_date IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

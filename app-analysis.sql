---Combining all the apple store description tables into one---

CREATE TABLE applestore_description_combined AS

SELECT * FROM appleStore_description1
Union ALL

SELECT * FROM appleStore_description2
Union ALL

SELECT * FROM appleStore_description3
Union ALL

SELECT * FROM appleStore_description4

** EXPLORATORY DATA ANALYSIS
---- Number of Unique Apps in both tables.
SELECT COUNT (DISTINCT id) AS unique_app_ids
FROM AppleStore

SELECT COUNT (DISTINCT id) AS unique_app_ids
FROM applestore_description_combined 

---No missing data between the two tables.

---Check for any missing values in key fields in AppleStore
SELECT COUNT(*) AS missing_values
FROM AppleStore
where track_name IS NULL OR user_rating is NULL OR prime_genre  IS NULL

---Check for any missing values in key fields in appleapplestore_description_combined
SELECT COUNT(*) AS missing_values
FROM apple_store_descriptions_combined
WHERE id is NULL OR app_desc IS NULL

--- Total number of apps by each different genre ---
SELECT prime_genre, COUNT(*) AS number_of_apps
FROM AppleStore
GROUP BY prime_genre
ORDER BY number_of_apps DESC

--- Exploring the overall minimum, maximum and average user ratings for these apps ---
SELECT MIN(user_rating) AS min_rating,
	   MAX(user_rating) AS max_rating,
       AVG(user_rating) AS avg_rating
FROM AppleStore

SELECT 
	(price / 2) * 2 AS price_bin_start
    ((price / 2) * 2) + 2 as price_bind_end,
FROM AppleStore

GROUP BY price_bin_start
ORDER BY price_bin_start

** DATA ANALYSIS **

--- Rating comparisons between paid and free options---
SELECT CASE

	   WHEN price > 0 THEN 'Paid'
       ELSE 'Free'
       END AS app_type,
       AVG(user_rating) AS avg_rating
       
FROM AppleStore
GROUP BY app_type

--- Check to see the correlation between the number of supported languages and user ratings ---
SELECT CASE 

     	WHEN lang_num < 10 THEN "Less than 10 languages"
        WHEN lang_num BETWEEN 10 AND 30 THEN "Between 10 - 30 languages"
        ELSE "More than 30 langugaes"
        END AS Number_of_supported_Languages, 
        AVG(user_rating) AS Average_user_rating
        
FROM AppleStore
GROUP BY Number_of_supported_languages
ORDER BY Average_user_rating DESC

--- Top ten least rated app genres ---
SELECT prime_genre AS genre, AVG(user_rating) AS Average_user_rating
FROM AppleStore
GROUP BY prime_genre
ORDER BY Average_user_rating
LIMIT 10

--- Check to see if there is a correlation between app description and the average user rating ---
SELECT CASE

        WHEN length(a2.app_desc) < 500 THen "Short"
        WHEN length(a2.app_desc) BETWEEN 500 AND 1000 THEN "Medium"
        ELSE "Long"
        end as App_description_length,
		AVG(user_rating) AS Average_user_rating
        
FROM AppleStore AS a1
JOIN applestore_description_combined AS a2
ON a1.id = a2.id
GROUP BY App_description_length
ORDER BY Average_user_rating DESC

--- Check for the top-rated apps within each category ---
SELECT 
	track_name, 
    prime_genre, 
    user_rating
FROM (
    SELECT 
    track_name, 
    prime_genre, 
    user_rating,
    RANK() OVER (PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot desc) AS App_Rank
	FROM AppleStore
	) AS A
WHERE A.App_Rank = 1
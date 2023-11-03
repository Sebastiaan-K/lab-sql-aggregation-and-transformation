# Challenge 1:

USE sakila;

SHOW TABLES;

SELECT COUNT(*) FROM film;

#1.1 Determine the shortest and longest movie durations:
SELECT 
    MIN(length) AS min_duration,
    MAX(length) AS max_duration
FROM 
    film;

#1.2  Express the average movie duration in hours and minutes:
SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours,
    ROUND(AVG(length) % 60) AS avg_minutes
FROM 
    film;
    
#2.1 Calculate the number of days that the company has been operating:
SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM 
    rental;

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental:
SELECT 
    rental_id,
    rental_date,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM 
    rental
LIMIT 
    20;

 #2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week:   
SELECT 
    rental_id,
    rental_date,
    CASE
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM 
    rental;

#3. retrieve the film titles and their rental duration:
SELECT 
    title,
    IFNULL(CAST(rental_duration AS CHAR), 'Not Available') AS rental_duration
FROM 
    film
ORDER BY 
    title ASC;
    
#Challenge 2:

#1.1 The total number of films that have been released:
SELECT COUNT(*) AS total_films
FROM film;

#1.2 The number of films for each rating:
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

#1.3 The number of films for each rating, sorting the results in descending order of the number of films:
SELECT rating, COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;

#2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration:
SELECT rating, ROUND(AVG(length), 2) AS average_duration
FROM film
GROUP BY rating
ORDER BY average_duration DESC;

#2.2  Identify which ratings have a mean duration of over two hours:
SELECT rating, ROUND(AVG(length), 2) AS average_duration
FROM film
GROUP BY rating
HAVING average_duration > 120;

#3. Determine which last names are not repeated in the table actor:
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;
    
    
    
    
    
    
    
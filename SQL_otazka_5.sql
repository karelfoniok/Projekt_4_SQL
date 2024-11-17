-- 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

WITH primary_data AS(
	SELECT 
		year_of_measurement AS year,
		ROUND(AVG(average_salary), 0) AS average_salary, 
		ROUND(AVG(average_food_price), 2) AS average_food_price
	FROM t_karel_foniok_project_sql_primary_final
	GROUP BY
		year_of_measurement
),
secondary_data AS(
	SELECT 
		country_countries,
		`year`,
		GDP,
		gini,
		population
	FROM t_karel_foniok_project_sql_secondary_final
	WHERE 
		country_countries = 'Czech Republic'
),
combined_data AS (
	SELECT 
		p.year,
		p.average_salary,
		p.average_food_price,
		s.GDP,
		s.gini,
		s.population
	FROM primary_data AS p
	LEFT JOIN
		secondary_data AS s ON p.YEAR = s.YEAR
	ORDER BY 
		p.YEAR
),
percent_changes AS(
	SELECT
		year,
		average_salary,
		LAG(average_salary) OVER (ORDER BY year) AS prev_average_salary,
		average_food_price,
		LAG(average_food_price) OVER (ORDER BY year) AS prev_average_food_price,
		GDP,
		LAG(GDP) OVER (ORDER BY year) AS prev_GDP,
		gini,
		population,
		(average_salary - LAG(average_salary) OVER (ORDER BY year)) / 
		LAG(average_salary) OVER (ORDER BY year) * 100 
		AS percent_change_salary,
		(average_food_price - LAG(average_food_price) OVER (ORDER BY year)) / 
		LAG(average_food_price) OVER (ORDER BY year) * 100 
		AS percent_change_food_price,
		(GDP - LAG(GDP) OVER (ORDER BY year)) / 
		LAG(GDP) OVER (ORDER BY year) * 100 
		AS percent_change_GDP
	FROM combined_data
)
SELECT 
	year,
	average_salary,
	average_food_price,
	GDP,
	ROUND(percent_change_salary, 2) AS percent_change_salary,
	ROUND(percent_change_food_price, 2) AS percent_change_food_price,
	ROUND(percent_change_GDP, 2) AS percent_change_GDP,
	gini,
	population
FROM percent_changes
ORDER BY year;
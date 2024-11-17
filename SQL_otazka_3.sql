-- 3.Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH price_change AS(
	SELECT
		year_of_measurement,
		food_name,
		average_food_price,
		LAG(average_food_price) OVER(PARTITION BY food_name ORDER BY year_of_measurement) 
		AS previous_price_change,
		(average_food_price - LAG(average_food_price) OVER(PARTITION BY food_name ORDER BY year_of_measurement)) / 
		LAG(average_food_price) OVER(PARTITION BY food_name ORDER BY year_of_measurement) * 100 
		AS price_change		
	FROM t_karel_foniok_project_sql_primary_final
	WHERE 
		year_of_measurement BETWEEN '2006' AND '2018'
)
SELECT
	food_name,
	ROUND(AVG(price_change), 2) AS average_price_change
FROM price_change
GROUP BY 
	food_name
ORDER BY
	average_price_change;
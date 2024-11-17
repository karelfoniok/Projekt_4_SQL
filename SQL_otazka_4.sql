-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

WITH measurements AS (
    SELECT
        year_of_measurement,
        ROUND(AVG(average_food_price), 2) AS average_food_price,
        ROUND(AVG(average_salary), 0) AS average_salary,
        LAG(AVG(average_food_price)) OVER (ORDER BY year_of_measurement) AS year_before_avg_food_price,
        LAG(AVG(average_salary)) OVER (ORDER BY year_of_measurement) AS year_before_avg_salary
    FROM t_karel_foniok_project_sql_primary_final
    WHERE year_of_measurement BETWEEN '2006' AND '2018'
    GROUP BY year_of_measurement
)
SELECT
    year_of_measurement,
    average_food_price,
    average_salary,
    ROUND(
    	((average_food_price / year_before_avg_food_price) - 1) * 100, 2
    ) AS food_price_change,
    ROUND(
    	((average_salary / year_before_avg_salary) - 1) * 100, 2
    ) AS salary_change,
    ROUND(
	    ABS(
	    	((average_salary / year_before_avg_salary) - 1) * 100
	    ) - ABS(
	    	((average_food_price / year_before_avg_food_price) - 1
	    ) * 100), 2
	) AS percent_diff
FROM measurements
ORDER BY year_of_measurement;
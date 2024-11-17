-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT 
	year_of_measurement,
	round(avg(average_salary)) AS average_salary,
	food_name ,
	average_food_price ,
	round((avg(average_salary)) / average_food_price) as amount
FROM t_karel_foniok_project_SQL_primary_final
WHERE 
	(food_name LIKE '%Mléko%' OR food_name  LIKE '%Chléb%') 
	AND (year_of_measurement  = 2006 OR year_of_measurement  = 2018)
GROUP BY 
	year_of_measurement, 
	food_name  
ORDER BY amount;

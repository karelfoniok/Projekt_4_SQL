-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT 
	payroll_year,
	industry_name,
	average_salary,
	ROUND((average_salary - LAG(average_salary) OVER (PARTITION BY industry_name ORDER BY payroll_year))/
	LAG(average_salary) OVER (PARTITION BY industry_name ORDER BY payroll_year) * 100, 2) AS percent_change
FROM t_karel_foniok_project_sql_primary_final
GROUP BY 
	payroll_year, 
	industry_name 
ORDER BY 
	industry_name, 
	payroll_year;

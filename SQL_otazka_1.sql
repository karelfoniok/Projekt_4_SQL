-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT 
	payroll_year,
	industry_name,
	average_salary
FROM t_karel_foniok_project_sql_primary_final
GROUP BY payroll_year, industry_name 
ORDER BY industry_name ASC, payroll_year ASC;

-- project_sql_primary_final 
-- (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky)

CREATE OR REPLACE TABLE t_karel_foniok_project_sql_primary_final AS
SELECT year_of_measurement, payroll_year, food_name, average_food_price, industry_name, average_salary
FROM (
	SELECT cpc.name AS food_name, round(avg(cpr.value),2) AS average_food_price, YEAR(cpr.date_from) AS year_of_measurement
	FROM czechia_price cpr
	LEFT JOIN czechia_price_category cpc
	ON cpr.category_code = cpc.code
	GROUP BY food_name, year_of_measurement
	ORDER BY year_of_measurement, average_food_price ASC ) t1
LEFT JOIN (
	SELECT cpib.name AS industry_name, avg(cpay.value) AS average_salary, cpay.payroll_year
	FROM czechia_payroll cpay
	LEFT JOIN czechia_payroll_industry_branch cpib
	ON cpay.industry_branch_code = cpib.code
	WHERE cpay.value_type_code = 5958
		AND cpay.calculation_code = 100	
		AND cpay.unit_code = 200
		AND cpay.industry_branch_code IS NOT NULL
	GROUP BY cpib.name, cpay.payroll_year
	ORDER BY cpay.payroll_year) t2
ON year_of_measurement = payroll_year
ORDER BY year_of_measurement DESC, average_food_price ASC, average_salary ASC;

SELECT *
FROM t_karel_foniok_project_sql_primary_final;

-- project_sql_secondary_final 
-- (Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR)

CREATE OR REPLACE TABLE t_karel_foniok_project_sql_secondary_final AS 
SELECT 
	t1.continent, 
	country_countries, 
	country_economy, 
	t2.YEAR, 
	t2.gdp, 
	t2.gini, 
	t2.population
FROM (	
	SELECT c.country AS country_countries, c.continent
	FROM countries c 
	WHERE continent = 'Europe'
	AND c.country IS NOT NULL) t1
LEFT JOIN (
	SELECT e.country AS country_economy, e.population, e.YEAR, e.gdp, e.gini
	FROM economies e
	WHERE YEAR >= 2000 ) t2 
ON country_countries = country_economy;

SELECT *
FROM t_karel_foniok_project_sql_secondary_final;

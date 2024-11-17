# Projekt_4_SQL

author: Karel Foniok
email: karel.foniok@gmail.com
discord: karel_10181

## Analýza dostupnost základních potravin široké veřejnosti

Projekt porovnává dostupnost potravin na základě průměrných příjmů za období let 2006 - 2018. Cílem projektu je odpovědět na 5 výzkumných otázek na základě datového podkladu. 

## Datové sady použité pro projekt
1. **t_karel_foniok_project_sql_primary_final:** Tato tabulka obsahuje data mezd a cen potravin v České republice za sledované období.
2. **t_karel_foniok_project_sql_secondary_final:** Tato tabulka obsahuje dodatečná data o evropských státech včetně ČR, včetně HDP, GINI koeficientu a populace. 

## SQL skripty a výstupy
Pro zodpovězení výzkumných otázez byly připraveny SQL skripty.

## Odpovědi na výzkumné otázky

### 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Ve většině odvětví převažuje meziroční růst průměrných cen, nicméně najdou se i roky, kdy dochází k meziročnímu poklesu. Pouze u 5 z 19 odvětví se z dat dá vypozorovat, že ve sledovaném období nedošlo k meziročnímu poklesu.

### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roce 2006 bylo možné si za průměrnou mzdu koupit 1 262 kilogramů chleba a 1409 litrů mléka, v roce 2018 to bylo 1 319 kilogramů chleba a 1 614 litrů mléka.

### 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Potravina s nejnižším průměrným meziročním nárůstem ceny za sledované období je cukr krystalový, se změnou – 0,09%, takže se jedná o zlevnění daného produktu za sledované období. Pokud se podíváme na potravinu, kde došlo k nejnižšímu zdražení, jedná se o banány žluté s průměrným růstem 0,04% meziročně.

### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Ve sledovaném období nebyl v žádném roce meziroční nárůst cen potravin výrazně vyšší než růst mezd.

### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Z vývoje ukazatelů ve sledovaném období lze pozorovat určitou míru korelace mezi změnami HDP a změnami mzdové hladiny, která reaguje zpravidla s jednoročním zpožděním na vývoj HDP. U vývoje cen není tato závislost zcela jednoznačná. V některých letech dochází ke zvyšování či snižování cen potravin ruku v ruce s vývojem HDP, avšak v jiných letech lze sledovat inverzní trend. 

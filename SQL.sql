SELECT *
FROM ElectricityDB..cleaned_data2

--- Question 1: What is the trend of average total electricity prices (in euro/MWh) over time?

SELECT
datepart(year, [date]) as yr,
datepart(month, [date]) as mth,
avg(avg_total_price_euro_MWh) as avgtotalprice
FROM ElectricityDB..cleaned_data2
GROUP BY datepart(year, [date]), datepart(month, [date])
ORDER BY yr, mth 

--- Question 2: How do the average prices in the free market compare to those in the reference market?

SELECT
datepart(year, [date]) as yr,
datepart(month, [date]) as mth,
avg(avg_price_free_market_euro_MWh) as avgfreemarket,
avg(avg_price_reference_market_euro_MWh) as avgrefermarket
FROM ElectricityDB..cleaned_data2
GROUP BY datepart(year, [date]), datepart(month, [date])
ORDER BY yr, mth 

--- Question 3: What percentage of the total energy generation is from renewable sources?

SELECT
datepart(year, [date]) as yr,
datepart(month, [date]) as mth,
ROUND(avg(renewable_generation), 2) as avgrenewablegen
FROM ElectricityDB..cleaned_data2
GROUP BY datepart(year, [date]), datepart(month, [date])
ORDER BY yr, mth 

--- Question 4: What is the distribution of energy production by different renewable sources (e.g., wind, solar, hydroelectric) over the period?

SELECT 
DATEPART(year, [date]) AS yr,
DATEPART(month, [date]) AS mth,
energy_source,
ROUND(avg(renewable_generation), 2) AS totalgeneration
FROM ElectricityDB..cleaned_data2
GROUP BY DATEPART(year, [date]), DATEPART(month, [date]), energy_source
ORDER BY yr, mth

--- Question 5: What are the peak hours for total energy production?

SELECT
hour,
ROUND(avg(energy_total_MWh), 2) AS avgtotalenergy
FROM ElectricityDB..cleaned_data2
GROUP BY hour
ORDER BY avgtotalenergy Desc

--- Question 6: How does the total energy production vary month by month?

SELECT 
DATEPART(year, [date]) AS yr,
DATEPART(month, [date]) AS mth,
ROUND(avg(energy_total_MWh), 2) AS avgtotalenergy
FROM ElectricityDB..cleaned_data2
GROUP BY DATEPART(year, [date]), DATEPART(month, [date])
ORDER BY yr, mth

--- Question 7: What is the trend in the market share of free market versus reference market over the period?

SELECT
DATEPART(year, [date]) AS yr,
DATEPART(month, [date]) AS mth,
ROUND(avg(free_market_share), 2) AS avgfreemarket,
ROUND(avg(reference_market_share), 2) AS avgrefmarket
FROM ElectricityDB..cleaned_data2
GROUP BY DATEPART(year, [date]), DATEPART(month, [date])
ORDER BY yr, mth


/*

## Aggregate Your Friends and Code some SQL

Put together the following:

6. In January 2017, for which industry was the average weekly hours worked by production and nonsupervisory employees the highest? Which industry was the lowest?

*/
--
SELECT data_type_text
FROM LaborStatisticsDB.dbo.datatype

--
SELECT *
FROM LaborStatisticsDB.dbo.[period]

--
SELECT *
FROM LaborStatisticsDB.dbo.january_2017

--highest
SELECT TOP 1 i.industry_name, ROUND(SUM(a.value), 2) AS avg_weekly_hours
FROM LaborStatisticsDB.dbo.january_2017 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    INNER JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
    INNER JOIN LaborStatisticsDB.dbo.period p ON a.period = p.period_code
WHERE dt.data_type_text LIKE '%AGGREGATE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES%'
    AND p.month LIKE '%January%'
GROUP BY i.industry_name
ORDER BY avg_weekly_hours DESC

--lowest
SELECT TOP 1 i.industry_name, ROUND(SUM(a.value), 2) AS avg_weekly_hours
FROM LaborStatisticsDB.dbo.january_2017 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    INNER JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
    INNER JOIN LaborStatisticsDB.dbo.period p ON a.period = p.period_code
WHERE dt.data_type_text LIKE '%AGGREGATE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES%'
    AND p.month LIKE '%January%'
GROUP BY i.industry_name
ORDER BY avg_weekly_hours ASC
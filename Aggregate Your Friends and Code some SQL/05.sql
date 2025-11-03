/*

5. What is the total weekly payroll for production and nonsupervisory employees across all industries in January 2017? Round to the nearest penny.

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

--
SELECT ROUND(SUM(a.value), 2)
FROM LaborStatisticsDB.dbo.january_2017 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    INNER JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
    INNER JOIN LaborStatisticsDB.dbo.period p ON a.period = p.period_code
WHERE dt.data_type_text LIKE '%AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES%' 
    AND p.month LIKE '%January%'
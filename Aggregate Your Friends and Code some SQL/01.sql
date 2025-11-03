/*
## Aggregate Your Friends and Code some SQL

Put together the following:

1. How many employees were reported in 2016 in all industries? Round to the nearest whole number.

*/

--29042
SELECT COUNT(*)
FROM LaborStatisticsDB.dbo.annual_2016 as A

--26709
SELECT COUNT(*)
FROM LaborStatisticsDB.dbo.series as S

--
SELECT *
FROM LaborStatisticsDB.dbo.annual_2016 as a
INNER JOIN LaborStatisticsDB.dbo.series as s
ON a.series_id = s.series_id

--
SELECT *
FROM LaborStatisticsDB.dbo.datatype

SELECT *
FROM LaborStatisticsDB.dbo.industry
--
SELECT COUNT(*)
FROM LaborStatisticsDB.dbo.annual_2016 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    INNER JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code

--
SELECT ROUND(SUM(a.value), 0)
FROM LaborStatisticsDB.dbo.annual_2016 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    INNER JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
WHERE dt.data_type_text like '%All Employees%'
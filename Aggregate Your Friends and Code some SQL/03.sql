/*

3. How many production/nonsupervisory employees were reported in 2016? Round to the nearest whole number. 

*/

--
SELECT data_type_text
FROM LaborStatisticsDB.dbo.datatype

--
SELECT *
FROM LaborStatisticsDB.dbo.[period]

--
SELECT *
FROM LaborStatisticsDB.dbo.annual_2016

--
SELECT *
FROM LaborStatisticsDB.dbo.annual_2016 as s

--
SELECT a.year
FROM LaborStatisticsDB.dbo.annual_2016 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    RIGHT JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
WHERE dt.data_type_text like '%PRODUCTION AND NONSUPERVISORY EMPLOYEES%'
--
SELECT ROUND(SUM(a.value), 0)
FROM LaborStatisticsDB.dbo.annual_2016 as a
    INNER JOIN LaborStatisticsDB.dbo.series as s ON a.series_id = s.series_id
    INNER JOIN LaborStatisticsDB.dbo.datatype dt ON s.data_type_code = dt.data_type_code
    RIGHT JOIN LaborStatisticsDB.dbo.industry as i ON s.industry_code = i.industry_code
WHERE dt.data_type_text LIKE '%PRODUCTION AND NONSUPERVISORY EMPLOYEES%'
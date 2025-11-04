/*

## Subqueries, Unions, Derived Tables, Oh My!

2.  Create a `Union` table comparing average weekly earnings of production and nonsupervisory employees between `annual_2016` and `january_2017` using the data type 30.  
    Round to the nearest penny.  
    You should have a column for the average earnings and a column for the year, and the period.

*/

SELECT ROUND(AVG(a.value), 2) AS average_earnings, 2016 AS year, 'Annual' AS period
FROM LaborStatisticsDB.dbo.annual_2016 AS a
INNER JOIN LaborStatisticsDB.dbo.series s ON a.series_id = s.series_id
WHERE s.data_type_code = 30

UNION

SELECT ROUND(AVG(j.value), 2) AS average_earnings, 2017 AS year, 'January' AS period
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series AS s ON j.series_id = s.series_id
WHERE s.data_type_code = 30;

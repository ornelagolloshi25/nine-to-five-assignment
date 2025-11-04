/*

## Subqueries, Unions, Derived Tables, Oh My!

1.  Write a query that returns the `series_id`, `industry_code`, `industry_name`, and `value` from the `january_2017` 
    table but only if that value is greater than the average value for `annual_2016` of `data_type_code` 82.

*/

SELECT  j.series_id, s.industry_code, i.industry_name, j.value
FROM LaborStatisticsDB.dbo.january_2017 AS j
INNER JOIN LaborStatisticsDB.dbo.series AS s  ON j.series_id = s.series_id
INNER JOIN LaborStatisticsDB.dbo.industry AS i ON s.industry_code = CAST(i.industry_code AS nvarchar)
WHERE j.value > (
    SELECT AVG(a.value)
    FROM LaborStatisticsDB.dbo.annual_2016 a
    INNER JOIN LaborStatisticsDB.dbo.series s2 ON a.series_id = s2.series_id
    WHERE s2.data_type_code = 82
);

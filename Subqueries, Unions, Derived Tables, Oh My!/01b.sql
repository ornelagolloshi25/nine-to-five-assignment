/*

## Subqueries, Unions, Derived Tables, Oh My!

1.  Write a query that returns the `series_id`, `industry_code`, `industry_name`, and `value` from the `january_2017` 
    table but only if that value is greater than the average value for `annual_2016` of `data_type_code` 82.

    **Optional Bonus Question:** Write the above query as a common table expression!

*/

WITH avg_value_cte AS (
    SELECT AVG(a.value) AS avg_value
    FROM LaborStatisticsDB.dbo.annual_2016 AS a
    INNER JOIN LaborStatisticsDB.dbo.series s ON a.series_id = s.series_id
    WHERE s.data_type_code = 82
)

SELECT  j.series_id, s.industry_code, i.industry_name, j.value
FROM LaborStatisticsDB.dbo.january_2017 AS j
INNER JOIN LaborStatisticsDB.dbo.series AS s 
ON j.series_id = s.series_id
INNER JOIN LaborStatisticsDB.dbo.industry AS i ON s.industry_code = CAST(i.industry_code AS nvarchar)
INNER JOIN avg_value_cte avg ON j.value > avg.avg_value;

/*

## Join in on the Fun

Time to start joining! You can choose the type of join you use, just make sure to make a  note!

3. Join `series` and `industry` on `industry_code`.

*/

--
SELECT *
FROM LaborStatisticsDB.dbo.series AS s
INNER JOIN LaborStatisticsDB.dbo.industry AS i 
ON s.industry_code = CAST(i.industry_code AS nvarchar);


-- Limiting rows returned from query, uncomment the line below to start on your query!
SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.series AS s
INNER JOIN LaborStatisticsDB.dbo.industry AS i 
ON s.industry_code = CAST(i.industry_code AS nvarchar)
ORDER BY s.series_id
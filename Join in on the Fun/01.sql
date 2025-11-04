/*

## Join in on the Fun

Time to start joining! You can choose the type of join you use, just make sure to make a  note!

1. Join `annual_2016` with `series` on `series_id`. We only want the data in the `annual_2016` table to be included in the result.

*/

SELECT *
FROM LaborStatisticsDB.dbo.annual_2016 as a
LEFT JOIN LaborStatisticsDB.dbo.series as s
On a.series_id = s.series_id

-- Limiting rows returned from query, uncomment the line below to start on your query!
SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.annual_2016 as a
LEFT JOIN LaborStatisticsDB.dbo.series as s
On a.series_id = s.series_id
ORDER BY id


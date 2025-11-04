/*

## Join in on the Fun

Time to start joining! You can choose the type of join you use, just make sure to make a  note!

2. Join `series` and `datatype` on `data_type_code`.

*/

SELECT *
FROM LaborStatisticsDB.dbo.series as s
INNER JOIN LaborStatisticsDB.dbo.datatype as dt
ON s.data_type_code = dt.data_type_code

--
SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.series as s
INNER JOIN LaborStatisticsDB.dbo.datatype as dt
ON s.data_type_code = dt.data_type_code
ORDER BY s.series_id
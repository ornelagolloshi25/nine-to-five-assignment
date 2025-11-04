/*


## Summarize Your Results

With what you know now about the  Bureau of Labor Statistics (BLS) Current Employment Survey (CES) results and working with the Labor Statistics Database, answer the following questions. Note that while this is subjective, you should include relevant data to back up your opinion.

2. In which industries did production and nonsupervisory employees fare better?

*/

SELECT 
    i.industry_name,
    ROUND(AVG(CASE WHEN s.data_type_code = 30 THEN j.value END), 2) AS avg_weekly_earnings,
    ROUND(AVG(CASE WHEN s.data_type_code = 82 THEN j.value END), 2) AS avg_weekly_hours
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series AS s ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry i ON s.industry_code = CAST(i.industry_code AS nvarchar)
WHERE s.data_type_code IN (30, 82)
  AND i.industry_name IS NOT NULL
GROUP BY i.industry_name
ORDER BY avg_weekly_earnings DESC, avg_weekly_hours DESC;

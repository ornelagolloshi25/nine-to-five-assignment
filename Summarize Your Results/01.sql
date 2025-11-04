/*

## Summarize Your Results

With what you know now about the  Bureau of Labor Statistics (BLS) Current Employment Survey (CES) results and working with the Labor Statistics Database, answer the following questions. Note that while this is subjective, you should include relevant data to back up your opinion.

1. During which time period did production and nonsupervisory employees fare better?

*/
-- Average weekly earnings and hours for 2016
SELECT 
    ROUND(AVG(CASE WHEN s.data_type_code = 30 THEN a.value END), 2) AS avg_weekly_earnings,
    ROUND(AVG(CASE WHEN s.data_type_code = 82 THEN a.value END), 2) AS avg_weekly_hours,
    '2016' AS year,
    'Annual' AS period
FROM LaborStatisticsDB.dbo.annual_2016 AS a
JOIN LaborStatisticsDB.dbo.series AS s ON a.series_id = s.series_id
WHERE s.data_type_code IN (30, 82)

UNION

-- Average weekly earnings and hours for January 2017
SELECT 
    ROUND(AVG(CASE WHEN s.data_type_code = 30 THEN j.value END), 2) AS avg_weekly_earnings,
    ROUND(AVG(CASE WHEN s.data_type_code = 82 THEN j.value END), 2) AS avg_weekly_hours,
    '2017' AS year,
    'January' AS period
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series AS s ON j.series_id = s.series_id
WHERE s.data_type_code IN (30, 82);

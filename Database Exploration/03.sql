/*

3. What is the series id for  women employees in the commercial banking industry in the financial activities supersector?

*/

select *
from LaborStatisticsDB.dbo.supersector

select *
from LaborStatisticsDB.dbo.industry

SELECT data_type_code, data_type_text
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text LIKE '%women%';

SELECT s.series_id, s.data_type_code,s.industry_code, s.supersector_code
FROM LaborStatisticsDB.dbo.series as s
INNER JOIN LaborStatisticsDB.dbo.datatype as dt
ON s.data_type_code = dt.data_type_code
INNER JOIN LaborStatisticsDB.dbo.industry as i
on s.industry_code = i.industry_code
INNER JOIN LaborStatisticsDB.dbo.supersector as ss
on s.supersector_code = ss.supersector_code
WHERE dt.data_type_text LIKE '%women%'
    AND i.industry_name LIKE '%commercial banking%'
    AND ss.supersector_name LIKE '%financial activities%'  

SELECT s.series_id
FROM LaborStatisticsDB.dbo.series as s
INNER JOIN LaborStatisticsDB.dbo.datatype as dt
ON s.data_type_code = dt.data_type_code
INNER JOIN LaborStatisticsDB.dbo.industry as i
on s.industry_code = i.industry_code
INNER JOIN LaborStatisticsDB.dbo.supersector as ss
on s.supersector_code = ss.supersector_code
WHERE dt.data_type_text LIKE '%women%'
    AND i.industry_name LIKE '%commercial banking%'
    AND ss.supersector_name LIKE '%financial activities%'  

/*

3. What is the series id for  women employees in the commercial banking industry in the financial activities supersector?

*/

SELECT data_type_code, data_type_text
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text LIKE '%women%';
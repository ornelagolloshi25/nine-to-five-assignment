SELECT *
FROM LaborStatisticsDB.dbo.annual_2016


SELECT *
FROM LaborStatisticsDB.dbo.january_2017

SELECT *
FROM LaborStatisticsDB.dbo.datatype

SELECT *
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text LIKE '%women%';

SELECT data_type_code, data_type_text
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text LIKE '%women%';

/*
10	WOMEN EMPLOYEES
39	WOMEN EMPLOYEES-TO-ALL EMPLOYEES RATIO
*/
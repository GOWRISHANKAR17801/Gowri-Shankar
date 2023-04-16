# SQL PROJECT.2
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# QUESTION.1Create new schema as alumni
CREATE DATABASE alumni;
USE alumni;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


# QUESTION.2-->Import all .csv files into MySQL
-- 6.CSV files are IMPORTED
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


# QUESTION.3-->Run SQL command to see the structure of six tables
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/*# QUESTION.4-->Display first 1000 rows of tables 
(College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.*/
SELECT * FROM college_a_hs LIMIT 1000;
SELECT * FROM college_a_se LIMIT 1000;
SELECT * FROM college_a_sj LIMIT 1000;
SELECT * FROM college_b_hs LIMIT 1000;
SELECT * FROM college_b_se LIMIT 1000;
SELECT * FROM college_b_sj LIMIT 1000;
-- Displayed the given statements in jupyter Notebook.alter
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* QUESTION.5.Import first 1500 rows of tables 
(College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.*/

/*-- In this question I tried to change the limit to 1500 in EXCEL sheet 
but in mysystem it only allows 100 table only to insert.*/
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* QUESTION.6.Perform data cleaning on table College_A_HS and store cleaned data in view 
College_A_HS_V, Remove null values */
CREATE OR REPLACE VIEW college_a_hs_V as SELECT * FROM college_a_hs WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Location IS NOT NULL;
SELECT * FROM college_a_hs_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.7.Perform data cleaning on table College_A_SE and store 
cleaned data in view College_A_SE_V, Remove null values.*/
CREATE OR REPLACE VIEW college_a_se_V as SELECT * FROM college_a_se WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL 
AND Location IS NOT NULL;
SELECT * FROM college_a_se_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.8.Perform data cleaning on table College_A_SJ and 
store cleaned data in view College_A_SJ_V, Remove null values.*/
CREATE OR REPLACE VIEW college_a_sj_V as SELECT * FROM college_a_sj WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL 
AND Designation IS NOT NULL AND Location IS NOT NULL;
SELECT * FROM college_a_sj_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/*QUESTION.9.Perform data cleaning on table College_B_HS and 
store cleaned data in view College_B_HS_V, Remove null values.*/
CREATE OR REPLACE VIEW college_b_hs_V as SELECT * FROM college_b_hs WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BRANCH IS NOT NULL AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus 
IS NOT NULL AND HSDegree IS NOT NULL 
AND EntranceExam IS NOT NULL AND Institute IS NOT NULL AND Location IS NOT NULL;
SELECT * FROM college_b_hs_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.10.Perform data cleaning on table College_B_SE and 
store cleaned data in view College_B_SE_V, Remove null values.*/
CREATE OR REPLACE VIEW college_b_se_V as SELECT * FROM college_b_se WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BRANCH IS NOT NULL AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus 
IS NOT NULL AND Organization IS NOT NULL AND Location IS NOT NULL;
SELECT * FROM college_b_se_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.11.Perform data cleaning on table College_B_SJ and 
store cleaned data in view College_B_SJ_V, Remove null values.*/
CREATE OR REPLACE VIEW college_b_sj_V as SELECT * FROM college_b_sj WHERE RollNo IS NOT NULL
AND LastUpdate IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL 
AND BRANCH IS NOT NULL AND BATCH IS NOT NULL AND Degree IS NOT NULL AND PresentStatus 
IS NOT NULL AND Organization IS NOT NULL AND Designation IS NOT NULL AND Location IS NOT NULL;
SELECT * FROM college_b_sj_V;
DESC college_b_sj_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.12.Make procedure to use string function/s for converting record of 
Name, FatherName, MotherName into lower case for views 
(College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V)*/

-- College_a_hs_v
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_a_hs_V;

-- College_a_se_v
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_a_se_V;

-- College_a_sj_v
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_a_sj_V;

-- College_b_hs_V
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_b_hs_V;

-- College_b_se_v
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_b_se_V;

-- College_b_sj_v
SELECT LOWER(Name),LOWER(FatherName),LOWER(MotherName) FROM college_a_sj_V;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


/* QUESTION.14.Write a query to create procedure get_name_collegeA using the cursor to 
fetch names of all students from college A.*/
DELIMITER $$
CREATE PROCEDURE get_name_collegeA (INOUT naming TEXT(40000))
BEGIN 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(16000) DEFAULT"";
DECLARE namedetail 
CURSOR FOR 
SELECT Name FROM college_a_hs_V 
UNION SELECT Name FROM college_a_se_V 
UNION SELECT Name FROM college_a_sj_V;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN namedetail;
getname:LOOP 
FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE getname;
END IF;
SET naming = CONCAT(namelist,";",naming);
END LOOP getname;
CLOSE namedetail;
END $$
DELIMITER ;

SET @naming="";
CALL get_name_collegeA(@naming);
SELECT @naming Names_of_collegeA;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* QUESTION.15.Write a query to create procedure 
get_name_collegeB using the cursor to fetch names of all students from college B.*/
DELIMITER $$
CREATE PROCEDURE get_name_collegeB (INOUT naming TEXT(40000))
BEGIN 
DECLARE finished INT DEFAULT 0;
DECLARE namelist VARCHAR(16000) DEFAULT"";
DECLARE namedetail 
CURSOR FOR 
SELECT Name FROM college_b_hs_V 
UNION SELECT Name FROM college_b_se_V 
UNION SELECT Name FROM college_b_sj_V;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN namedetail;
getname:LOOP 
FETCH namedetail INTO namelist;
IF finished = 1 THEN LEAVE getname;
END IF;
SET naming = CONCAT(namelist,";",naming);
END LOOP getname;
CLOSE namedetail;
END $$
DELIMITER ; 

SET @naming="";
CALL get_name_collegeB(@naming);
SELECT @naming Names_of_collegeB;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* QUESTION.16.Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
Note: Approximate percentages are considered for career choices.*/
SELECT "HigherStudies" PresentStatus,(SELECT COUNT(*) FROM college_a_hs)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 College_A_Percentage,
(SELECT COUNT(*) FROM college_b_hs)/
((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+
(SELECT COUNT(*) FROM college_b_sj))*100 College_B_Percentage UNION 
SELECT "Self Employed"PresentStatus,(SELECT COUNT(*) FROM college_a_se)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 College_A_Percentage,
(SELECT COUNT(*) FROM college_b_se)/
((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+
(SELECT COUNT(*) FROM college_b_sj))*100 College_B_Percentage UNION
SELECT "Service Job"PresentStatus,(SELECT COUNT(*) FROM college_a_sj)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 College_A_Percentage,
(SELECT COUNT(*) FROM college_b_se)/
((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_sj)+
(SELECT COUNT(*) FROM college_b_sj))*100 College_B_Percentage;

/* I checked The last 16th  question But The percentage is came like this only */

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --






-- CLEANING DATA PROCEDURES
-- step 1-Check the database
SELECT * FROM capoeira.automobile_data;
-- checking for
SELECT
	distinct fuel_type
FROM 
	automobile_data;
 -------------------------------------
SELECT 
	min(length) AS min_length,
    max(length) AS max_length
FROM
	automobile_data;
----------------------------------------  
SELECT
  *
FROM
  automobile_data 
WHERE 
  num_of_doors = "";
------------------------------------------
UPDATE
  automobile_data
SET
  num_of_doors = "four"
WHERE
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";
  -----------------
UPDATE
  automobile_data
SET
  num_of_doors = "four"
WHERE
  make = "mazda"
  AND fuel_type = "diesel"
  AND body_style = "sedan";
------------------------------------------
SELECT
  DISTINCT num_of_cylinders
FROM
  automobile_data;
  
 ------------------------------------------ 
UPDATE
  automobile_data
SET
  num_of_cylinders = "two"
WHERE
  num_of_cylinders = "tow";
  
 ------------------------------------------
 
 SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  automobile_data;
  ----------------
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  automobile_data
WHERE
  compression_ratio <> 70;
  
 ------------------------------------------
SELECT
   COUNT(*) AS num_of_rows_to_delete
FROM
   automobile_data
WHERE
   compression_ratio = 70;
   -------------------
DELETE
	automobile_data
FROM
	automobile_data
WHERE
	compression_ratio = 70;

 ------------------------------------------
 
SELECT
  DISTINCT drive_wheels
FROM
  automobile_data;
  
-----------
SELECT
  DISTINCT drive_wheels,
  LENGTH(drive_wheels) AS string_length
FROM
  automobile_data;
  -------------
UPDATE
  automobile_data
SET
  drive_wheels = TRIM(drive_wheels)
WHERE TRUE;
--------------


SELECT 
	max(price) AS maximun_price
FROM
	automobile_data;
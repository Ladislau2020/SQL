
-- CLEANING DATA PROCEDURES
-- step 1-Check the database
SELECT * FROM capoeira.automobile_data;
-- checking for repeated values
SELECT
	distinct fuel_type
FROM 
	automobile_data;
 
 -- Ensuring the length of the values
SELECT 
	min(length) AS min_length,
    max(length) AS max_length
FROM
	automobile_data;

-- Searching for empty or null values  
SELECT
  *
FROM
  automobile_data 
WHERE 
  num_of_doors = "";

-- Fixing empty Values
UPDATE
  automobile_data
SET
  num_of_doors = "four"
WHERE
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";


UPDATE
  automobile_data
SET
  num_of_doors = "four"
WHERE
  make = "mazda"
  AND fuel_type = "diesel"
  AND body_style = "sedan";

-- Searching for mispelled errors
SELECT
  DISTINCT num_of_cylinders
FROM
  automobile_data;
  
 -- Fixing mispelled errors 
UPDATE
  automobile_data
SET
  num_of_cylinders = "two"
WHERE
  num_of_cylinders = "tow";
  
 -- Searching data integrity
 
 SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  automobile_data;

-- Ensuring the data integrity errors
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  automobile_data
WHERE
  compression_ratio <> 70;
  
 -- Ensuring the data we want to fix or delete
SELECT
   COUNT(*) AS num_of_rows_to_delete
FROM
   automobile_data
WHERE
   compression_ratio = 70;

-- Deteling the data for its integrity
DELETE
	automobile_data
FROM
	automobile_data
WHERE
	compression_ratio = 70;

 -- Searching for wrong spaces in strings
 
SELECT
  DISTINCT drive_wheels
FROM
  automobile_data;
  
-- Ensuring the wrong spaces errors
SELECT
  DISTINCT drive_wheels,
  LENGTH(drive_wheels) AS string_length
FROM
  automobile_data;

-- Fixing wrong spaces erros
UPDATE
  automobile_data
SET
  drive_wheels = TRIM(drive_wheels)
WHERE TRUE;


-- Ensuring our updates
SELECT 
	max(price) AS maximun_price
FROM
	automobile_data;
/* SQL Project to know that how many people's are using the Android and Ios,
then how they are using their soical media account */

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# -->Creating the new schema as ecommerce

CREATE SCHEMA ecommerce;
USE ecommerce;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Importing the csv file users_data into MySQL

/* the steps has been that how I entered the data into my Schema */
-- (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)
-- we import the file in navigator by using the option load spatial data of ecommerce options

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Running the SQL command to see the structure of table
USE ecommerce;
SELECT * FROM users_data;
DESC users_data;
select * from users_data;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# --> Runnning the SQL command to select first 100 rows of the database

USE ecommerce;
SELECT * FROM users_data LIMIT 100;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# -->Finding that how many distinct values exist in table for field country and language

USE ecommerce;
SELECT COUNT(DISTINCT country),COUNT(DISTINCT language) FROM users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# --> Checking whether male users are having maximum followers or female users.

USE ecommerce;
SELECT gender,MAX(socialNbFollowers) FROM users_data GROUP BY gender;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Calculating the total users those who 
-- Uses Profile Picture in their Profile
-- Uses Application for Ecommerce platform
-- Uses Android app
-- Uses ios app

USE ecommerce;
SELECT COUNT(hasProfilePicture) FROM users_data;
SELECT COUNT(hasAnyApp) FROM users_data;
SELECT COUNT(hasAndroidApp) FROM users_data;
SELECT count(hasIosApp) FROM users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* -->.Calculate the total number of buyers for each country and sort the result in descending order of 
total number of buyers.*/

USE ecommerce;
SELECT 
    country, COUNT(productsBought)
FROM
    users_data
WHERE
    productsBought != 0
GROUP BY country
ORDER BY COUNT(productsBought) DESC;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* --> Calculating the total number of sellers for each country and sort the result in 
ascending order of total number of sellers. */

USE ecommerce;
SELECT 
    country, COUNT(productsSold)
FROM
    users_data
WHERE
    productsSold != 1
GROUP BY country
ORDER BY COUNT(productsSold) ASC;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*-->Displaying the name of top 10 countries having maximum products pass rate.*/

USE ecommerce;
SELECT 
    country, MAX(productsPassRate)
FROM
    users_data
GROUP BY country
ORDER BY MAX(productsPassRate)
LIMIT 10;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* -->Calculating the number of users on an ecommerce platform for different language choices.*/

USE ecommerce;
SELECT COUNT(language) FROM users_data GROUP BY language;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* -->Check out the choice of female users about putting the product in a wishlist 
or to like socially on an ecommerce platform.*/ 

SELECT COUNT(productsWished) FROM users_data;
SELECT COUNT(socialproductsLiked) FROM users_data;
SELECT 
    COUNT(productsWished)
FROM
    users_data
WHERE
    (gender = 'F' AND productsWished > 0) 
UNION SELECT 
    COUNT(socialproductsLiked)
FROM
    users_data
WHERE
    (gender = 'F' AND socialProductsLiked > 0);
    
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Checking the choice of male users about being seller or buyer */

USE ecommerce;
SELECT COUNT(productsBought) FROM users_data;
SELECT COUNT(productsSold) FROM users_data;
SELECT 
    COUNT(productsBought)
FROM
    users_data
WHERE
    (gender = 'M' AND productsBought > 0) 
UNION SELECT 
    COUNT(productsSold)
FROM
    users_data
WHERE
    (gender = 'M' AND productsSold > 0);
    
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*#-->Finding out that Which country is having maximum number of buyers */

USE ecommerce;
SELECT country,COUNT(productsBought) FROM users_data GROUP BY country ORDER BY (productsBrought) DESC;
SELECT country,MAX(productsBoughts) FROM users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* -->Listing out the name of 10 countries having zero number of sellers.*/

USE ecommerce;
SELECT 
    country, SUM(ProductsSold) sellers
FROM
    users_data
GROUP BY country
ORDER BY SUM(productsSold)
LIMIT 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Displaying the record of top 110 users who have used ecommerce platform recently.*/

USE ecommerce;
SELECT * FROM users_data ORDER BY daysSinceLastLogin LIMIT 110;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*-->Calculating the number of female users those who have not logged in since last 100 days.*/

USE ecommerce;
SELECT 
    COUNT(gender) female
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin > 100;
        
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*  Displaying the number of female users of each country at ecommerce platform.*/

USE ecommerce;
SELECT 
    country, COUNT(gender) FEMALE
FROM
    users_data
WHERE
    gender = 'F' AND hasAnyApp = 'True'
GROUP BY country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*  Displaying the number of male users of each country at ecommerce platform.*/

USE ecommerce;
SELECT 
    country, COUNT(gender) MALE
FROM
    users_data
WHERE
    gender = 'M' AND hasAnyApp = 'True'
GROUP BY country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*  --> Calculating the average number of products sold and bought on ecommerce platform by 
male users for each country.*/

USE ecommerce;
SELECT 
    AVG(productsSold) products_sold,
    AVG(productsBought) products_bought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --



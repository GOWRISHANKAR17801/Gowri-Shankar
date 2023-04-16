
## PROJECT.1 --> SQL
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# Question.1 Create new schema as ecommerce

CREATE SCHEMA ecommerce;
USE ecommerce;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.2Import .csv file users_data into MySQL
-- (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)
-- we import the file in navigator by using the option load spatial data of ecommerce options

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.3Run SQL command to see the structure of table
USE ecommerce;
SELECT * FROM users_data;
DESC users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.4 Run SQL command to select first 100 rows of the database

USE ecommerce;
SELECT * FROM users_data LIMIT 100;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.5 How many distinct values exist in table for field country and language

USE ecommerce;
SELECT COUNT(DISTINCT country),COUNT(DISTINCT language) FROM users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.6 Check whether male users are having maximum followers or female users.

USE ecommerce;
SELECT gender,MAX(socialNbFollowers) FROM users_data GROUP BY gender;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Question.7.Calculate the total users those
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

/*#8.Calculate the total number of buyers for each country and sort the result in descending order of 
total number of buyers. (Hint: consider only those users having at least 1 product bought.)*/

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

/* # Question.9.Calculate the total number of sellers for each country and sort the result in 
ascending order of total number of sellers. (Hint: consider only those users having at least 1 product sold.)*/

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

/*# Question.10-->Display name of top 10 countries having maximum products pass rate.*/

USE ecommerce;
SELECT 
    country, MAX(productsPassRate)
FROM
    users_data
GROUP BY country
ORDER BY MAX(productsPassRate)
LIMIT 10;

/* ##.Question.11-->Calculate the number of users on an ecommerce platform for different language choices.*/

USE ecommerce;
SELECT COUNT(language) FROM users_data GROUP BY language;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Question.12-->Check the choice of female users about putting the product in a wishlist 
or to like socially on an ecommerce platform. (Hint: use UNION to answer this question.)*/

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

/*# Question.13-->Check the choice of male users about being seller or buyer. 
(Hint: use UNION to solve this question.)*/

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

/*# Question.14-->Which country is having maximum number of buyers?*/

USE ecommerce;
SELECT country,COUNT(productsBought) FROM users_data GROUP BY country ORDER BY (productsBrought) DESC;
SELECT country,MAX(productsBoughts) FROM users_data;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* # Question.15-->List the name of 10 countries having zero number of sellers.*/

USE ecommerce;
SELECT 
    country, SUM(ProductsSold) sellers
FROM
    users_data
GROUP BY country
ORDER BY SUM(productsSold)
LIMIT 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/*#Question16.Display record of top 110 users who have used ecommerce platform recently.*/

USE ecommerce;
SELECT * FROM users_data ORDER BY daysSinceLastLogin LIMIT 110;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* # Question.17-->Calculate the number of female users those who have not logged in since last 100 days.*/

USE ecommerce;
SELECT 
    COUNT(gender) female
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin > 100;
        
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Question.18--> Display the number of female users of each country at ecommerce platform.*/

USE ecommerce;
SELECT 
    country, COUNT(gender) FEMALE
FROM
    users_data
WHERE
    gender = 'F' AND hasAnyApp = 'True'
GROUP BY country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Question.19--> Display the number of male users of each country at ecommerce platform.*/

USE ecommerce;
SELECT 
    country, COUNT(gender) MALE
FROM
    users_data
WHERE
    gender = 'M' AND hasAnyApp = 'True'
GROUP BY country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Question.20 --> Calculate the average number of products sold and bought on ecommerce platform by 
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



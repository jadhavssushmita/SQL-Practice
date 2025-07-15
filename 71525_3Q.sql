## Author: Sushmita Jadhav
## Daily SQL Questions



## 15 July 2025 |  TUESDAY
####################################################################################################################

#Q1 EASY 
## Find all customers who never order anything

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT DISTINCT customerId FROM Orders)

#Q2 MEDIUM
## Rank scores highest to lowest, do not skip rank when event of tie, thus use dense rank
SELECT
score
, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores

#Q3 MEDIUM

## Initial launch performance
WITH temp AS
(
    SELECT product_id, MIN(year) AS first_year
    FROM Sales s
    GROUP BY 1
)
SELECT s.product_id, t.first_year, s.quantity, s.price
FROM temp t
INNER JOIN Sales s ON t.first_year = s.year;

####################################################################################################################

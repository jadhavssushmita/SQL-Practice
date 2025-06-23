## Atleast 100 orders in a given month
SELECT
p.product_name
,SUM(o.unit) AS unit
FROM Products p
INNER JOIN Orders o
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
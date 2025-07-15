## Author: Sushmita Jadhav
## Daily SQL Questions

## 14 July 2025
####################################################################################################################


#Q1: Calculate distance travelled, if user has not travelled then show number 0 using coalesce function
SELECT
u.name
,COALESCE(SUM(r.distance),0) AS travelled_distance
FROM Users u LEFT JOIN Rides r 
ON u.id = r.user_id
GROUP BY u.name
ORDER BY 2 DESC, 1 ASC;

####################################################################################################################

#Q2: Level: Hard Leetcode 262
SELECT
trips.request_at AS Day
, ROUND(SUM(CASE 
    WHEN trips.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1
    ELSE 0
    END ) / COUNT(id) * 1.0,2) AS 'Cancellation Rate'
FROM trips 
INNER JOIN Users passengers ON trips.client_id = passengers.users_id AND passengers.banned = 'No'
INNER JOIN Users driver ON trips.driver_id = driver.users_id AND driver.banned = 'No'
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
ORDER BY 1;
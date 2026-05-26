
-- 1.
-- Let’s examine the three tables.
-- 3.
-- Try out a simple cross join between riders and cars
-- 4.
-- Suppose we want to create a Trip Log with the trips and its users.
-- Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
-- Let trips be the left table.
-- 5.
-- Suppose we want to create a link between the trips and the cars used during those trips.
-- Find the columns to join on and combine the trips and cars table using an INNER JOIN.
-- 6.
-- The new riders data are in! There are three new users this month.
-- Stack the riders table on top of the new table named riders2.
-- 7.
-- What is the average cost for a trip?
-- 8.
-- Lyft is looking to do an email campaign for all the irregular users.
-- Find all the riders who have used Lyft less than 500 times!
-- 9.
-- Calculate the number of cars that are active.
-- 10.
-- It’s safety recall time for cars that have been on the road for a while.
-- Write a query that finds the two cars that have the highest trips_completed.

-- 1.
SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;
-- 3.
SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars;
-- 4.
SELECT *
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;

SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first AS rider_first,
   riders.last AS rider_last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;
-- 5.
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;
-- 6.
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;
-- 7.
SELECT AVG(cost)
FROM trips;

SELECT ROUND(AVG(cost), 2)
FROM trips;
-- 8.
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;
-- 9.
SELECT COUNT(*)
FROM cars
WHERE status = 'active';
-- 10.
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
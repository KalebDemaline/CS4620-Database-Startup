-- 1
-- Inventory report: For each topping in the database, show the topping name, the current
-- inventory level and the number of X-large pizzas that could be made using that amount of the
-- topping. Order alphabetically by topping name.

SELECT name, inventory_level, inventory_level/amount as max_xl_pizzas
FROM TOPPINGS t
JOIN TOPPING_AMOUNT ta ON t.top_id=ta.top_id
WHERE size="x-large";

-- 2
-- Revenue report: For each day, display the total revenue (the total of all the order prices for the
-- day), the total expenses (total of all order costs of the day), and the total profit (revenue minus
-- expenses). Order by the date.

SELECT DATE(order_time) AS order_date,
    SUM(p.price) AS total_revenue,
    SUM(p.cost) AS total_expenses,
    SUM(p.price) - SUM(p.cost) AS total_profit
FROM ORDERS o
JOIN PIZZA p ON o.order_id=p.order_id
GROUP BY order_date
ORDER BY order_date;

-- 3
-- Customer report: For each customer in the database, display their name, the total number of
-- orders they have placed, the average of the order price, the total order price, the max order
-- price, and the minimum order price. Dine in orders should not be included

SELECT name, COUNT(*) AS num_orders, AVG(price) AS avg_price, SUM(price) AS total_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM REMOTE r
JOIN CUSTOMER c ON r.cust_id = c.cust_id
JOIN ORDERS o ON o.order_id=r.cust_id
GROUP BY r.cust_id;

-- 4
-- Dine in order report: For all dine in orders, show the average count of customers/seats per
-- order, the average order price, the total order price, the max order price and the minimum
-- order price.

SELECT 
    AVG(num_seats) AS avg_num_seats, AVG(price) AS avg_price, SUM(price) AS total_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM (
    SELECT o.order_id, count(seat_number) AS num_seats, price
    FROM IN_PERSON ip
    JOIN ORDERS o ON ip.order_id = o.order_id
    JOIN  SEAT_NUMBERS sn ON sn.order_id = o.order_id
    GROUP BY o.order_id) AS orderz;

-- 5
-- Order ticket: On March 5th at 7:11 pm, Andrew Wilkes-Krier placed an order. The kitchen staff
-- needs to know what to prepare for the order. For each pizza on the order, display the crust, size,
-- a list of toppings, and whether or not they ordered extra of that topping. It is fine to have
-- repeated data about the pizza (such as crust size, type) in order to display all the toppings in the
-- table, however the information should be ordered by the pizzas so all the toppings for one pizza
-- appear in consecutive rows.

SELECT t.name, p.pizza_id, size, crust_type, extra
FROM ORDERS o
JOIN PIZZA p ON p.order_id=o.order_id
JOIN PIZZA_TOPPINGS pt ON pt.pizza_id=p.pizza_id
JOIN BASE_PRICE b ON b.base_id = p.base_id
JOIN TOPPINGS t ON t.top_id=pt.top_id
JOIN REMOTE r ON r.order_id=o.order_id
JOIN CUSTOMER c on c.cust_id=r.cust_id
WHERE p.order_time LIKE "%03-05 19:11%" AND c.name = "Andrew Wilkes-Krier"
ORDER BY p.pizza_id;

-- 6
SELECT DATE(p.order_time) AS order_date,                          
CASE 
    WHEN r.pick_up = 1 THEN 'Pick-Up'                       
    WHEN ip.table_num IS NOT NULL THEN 'Dine-In'             
    ELSE 'Delivery'                                       
END AS order_type,
COUNT(DISTINCT p.order_id) AS total_orders,                 
COUNT(p.pizza_id) AS total_pizzas,                          
SUM(p.price) AS total_order_price                           
FROM (`PIZZA` p left join `REMOTE` r  on p.order_id = r.order_id) left join `IN_PERSON` ip on p.order_id = ip.order_id
GROUP BY DATE(p.order_time),                                         
CASE 
    WHEN r.pick_up = 1 THEN 'Pick-Up'
    WHEN ip.table_num IS NOT NULL THEN 'Dine-In'
    ELSE 'Delivery'
END
ORDER BY order_date, order_type;  

-- 7
SELECT d.name, COUNT(o.order_id) order_count, SUM(da.dollar_amount) dollar, SUM(o.price*(pe.percentage/100)) percent
FROM ((((`PIZZA_DISCOUNT` pd JOIN `PIZZA` p ON p.pizza_id  = pd.pizza_id) JOIN `ORDERS` o ON p.order_id = o.order_id) JOIN `DISCOUNT` d ON pd.discount_id = d.discount_id) left join `PERCENTAGE` pe on d.discount_id = pe.discount_id) left join `DOLLAR_AMOUNT` da on d.discount_id = da.discount_id 
group by d.name;

-- 8
SELECT t.name, count(t.top_id) 
FROM (`TOPPINGS` t LEFT JOIN `PIZZA_TOPPINGS` pt ON t.top_id = pt.top_id) LEFT JOIN `PIZZA` p ON pt.pizza_id = p.pizza_id 
WHERE order_time LIKE '%2024-03-03%' 
GROUP BY t.name;

-- 9
SELECT size, COUNT(*) AS TotalPizzasOrdered, AVG(P.price) AS AveragePrice, AVG(P.cost) AS AverageCost 
FROM `PIZZA` P JOIN `BASE_PRICE` B ON P.base_id = B.base_id 
GROUP BY size;

-- 10
SELECT  crust_type, COUNT(*) AS TotalPizzasOrdered, AVG(P.price) AS AveragePrice, AVG(P.cost) AS AverageCost 
FROM `PIZZA` P JOIN `BASE_PRICE` B ON P.base_id = B.base_id 
GROUP BY crust_type;
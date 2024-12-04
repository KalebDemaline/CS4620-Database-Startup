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
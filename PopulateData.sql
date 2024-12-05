SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO  BASE_PRICE(base_id, size, crust_type, price, cost) VALUES
(1, 'small', 'Thin', 3.00, 0.50),
(2, 'small', 'Original', 3.00, 0.75),
(3, 'small', 'Pan', 3.50, 1.00),
(4, 'small', 'Gluten-Free', 4.00, 2.00),
(5, 'medium', 'Thin', 5.00, 1.00),
(6, 'medium', 'Original', 5.00, 1.50),
(7, 'medium', 'Pan', 6.00, 2.25),
(8, 'medium', 'Gluten-Free', 6.25, 3.00),
(9, 'Large', 'Thin', 8.00, 1.25),
(10, 'Large', 'Original', 8.00, 2.00),
(11, 'Large', 'Pan', 9.00, 3.00),
(12, 'Large', 'Gluten-Free', 9.50, 4.00),
(13, 'X-Large', 'Thin', 10.00, 2.00),
(14, 'X-Large', 'Original', 10.00, 3.00),
(15, 'X-Large', 'Pan', 11.50, 4.50),
(16, 'X-Large', 'Gluten-Free', 12.50, 6.00);

INSERT INTO TOPPINGS(top_id, name, unit_price, unit_cost, inventory_level) VALUES
(1, 'Pepperoni', 1.25, 0.2, 100),
(2, 'Sausage', 1.25, 0.15, 100),
(3, 'Ham', 1.5, 0.15, 78),
(4, 'Chicken', 1.75, 0.25, 56),
(5, 'Green Pepper', 0.5, 0.02, 79),
(6, 'Onion', 0.5, 0.02, 85),
(7, 'Roma tomato', 0.75, 0.03, 86),
(8, 'Mushrooms', 0.75, 0.1, 52),
(9, 'Black Olives', 0.6, 0.1, 39),
(10, 'Pineapple', 1, 0.25, 15),
(11, 'Jalapenos', 0.5, 0.05, 64),
(12, 'Banana Peppers', 0.5, 0.05, 36),
(13, 'Regular Cheese', 1.5, 0.12, 250),
(14, 'Four Cheese Blend', 2, 0.15, 150),
(15, 'Feta Cheese', 2, 0.18, 75),
(16, 'Goat Cheese', 2, 0.2, 54),
(17, 'Bacon', 1.5, 0.25, 89);

INSERT INTO TOPPING_AMOUNT(amount_id, amount, size, top_id) VALUES
(1, 2.0, 'small', 1),
(2, 2.75, 'medium', 1),
(3, 3.5, 'large', 1),
(4, 4.5, 'x-large', 1),
(5, 2.5, 'small', 2),
(6, 3, 'medium', 2),
(7, 3.5, 'large', 2),
(8, 4.25, 'x-large', 2),
(9, 2, 'small', 3),
(10, 2.5, 'medium', 3),
(11, 3.25, 'large', 3),
(12, 4, 'x-large', 3),
(13, 1.5, 'small', 4),
(14, 2, 'medium', 4),
(15, 2.25, 'large', 4),
(16, 3, 'x-large', 4),
(17, 1, 'small', 5),
(18, 1.5, 'medium', 5),
(19, 2, 'large', 5),
(20, 2.5, 'x-large', 5),
(21, 1, 'small', 6),
(22, 1.5, 'medium', 6),
(23, 2, 'large', 6),
(24, 2.75, 'x-large', 6),
(25, 2, 'small', 7),
(26, 3, 'medium', 7),
(27, 3.5, 'large', 7),
(28, 4.5, 'x-large', 7),
(29, 1.5, 'small', 8),
(30, 2, 'medium', 8),
(31, 2.5, 'large', 8),
(32, 3.5, 'x-large', 8),
(33, 0.75, 'small', 9),
(34, 1, 'medium', 9),
(35, 1.5, 'large', 9),
(36, 2, 'x-large', 9),
(37, 1, 'small', 10),
(38, 1.25, 'medium', 10),
(39, 1.75, 'large', 10),
(40, 2, 'x-large', 10),
(41, 0.5, 'small', 11),
(42, 0.75, 'medium', 11),
(43, 1.25, 'large', 11),
(44, 1.75, 'x-large', 11),
(45, 0.6, 'small', 12),
(46, 1, 'medium', 12),
(47, 1.3, 'large', 12),
(48, 1.75, 'x-large', 12),
(49, 2, 'small', 13),
(50, 3.5, 'medium', 13),
(51, 5, 'large', 13),
(52, 7, 'x-large', 13),
(53, 2, 'small', 14),
(54, 3.5, 'medium', 14),
(55, 5, 'large', 14),
(56, 7, 'x-large', 14),
(57, 1.75, 'small', 15),
(58, 3, 'medium', 15),
(59, 5, 'large', 15),
(60, 5.5, 'x-large', 15),
(61, 1.6, 'small', 16),
(62, 2.75, 'medium', 16),
(63, 4, 'large', 16),
(64, 5.5, 'x-large', 16),
(65, 1, 'small', 17),
(66, 1.5, 'medium', 17),
(67, 2, 'large', 17),
(68, 3, 'x-large', 17);

INSERT INTO DISCOUNT(discount_id, name) VALUES
(1, 'employee'),
(2, 'Lunch Special Medium'),
(3, 'Lunch Special Large'),
(4, 'Specialty Pizza'),
(5, 'Gameday Special');

INSERT INTO DOLLAR_AMOUNT(discount_id, dollar_amount) VALUES
(2, 1),
(3, 2),
(4, 1.5);

INSERT INTO PERCENTAGE(discount_id, percentage) VALUES
(1, 15),
(5, 20);

-- ORDER 1

INSERT INTO ORDERS (order_id, price, cost) 
VALUES (1, 13.50, 3.68);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (1, 13.50, 3.68, 'Completed', '2024-03-05 12:03:00', 9, 1); -- Large Thin Crust
INSERT INTO PIZZA_TOPPINGS (extra, pizza_id, top_id)
VALUES
  (TRUE, 1, 13), -- Regular Cheese (Extra)
  (FALSE, 1, 1), -- Pepperoni
  (FALSE, 1, 2); -- Sausage
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id)
VALUES (1, 3);  -- Lunch Special Large Discount
INSERT INTO SEAT_NUMBERS (seat_number, order_id)
VALUES (1, 1), (2, 1), (3, 1);
INSERT INTO IN_PERSON (table_num, order_id)
VALUES (14, 1);

-- -- ORDER 2

INSERT INTO ORDERS (order_id, price, cost) 
VALUES (2, 10.60, 3.23);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (2, 10.60, 3.23, 'Completed', '2024-03-03 12:05:00', 7, 2);  -- medium pan
INSERT INTO PIZZA_TOPPINGS (extra, pizza_id, top_id)
VALUES
  (FALSE, 2, 15),  -- Feta cheese
  (FALSE, 2, 9),  -- Black olives
  (FALSE, 2, 7),  -- Roma tomatoes
  (FALSE, 2, 8),  -- Mushrooms
  (FALSE, 2, 12);  -- Banana peppers
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id)  -- lunch special medium discount (2), specialty pizza (4)
VALUES (2, 2), (2, 4);
INSERT INTO SEAT_NUMBERS (seat_number, order_id)
VALUES (1, 2);
INSERT INTO IN_PERSON (table_num, order_id)
VALUES (4, 2);

-- -- ORDER 3

INSERT INTO ORDERS (order_id, price, cost) 
VALUES (3, 6.75, 1.40);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (3, 6.75, 1.40, 'Completed', '2024-03-03 12:05:00', 2, 3);  -- small original crust
INSERT INTO PIZZA_TOPPINGS (extra, pizza_id, top_id)
VALUES
  (FALSE, 3, 13),  -- Regular cheese
  (FALSE, 3, 4),  -- Chicken
  (FALSE, 3, 12);  -- Banana peppers
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id)
VALUES (3, 3);
INSERT INTO SEAT_NUMBERS (seat_number, order_id)
VALUES (2, 3);
INSERT INTO IN_PERSON (table_num, order_id)
VALUES (4, 3);

-- -- ORDER 4

INSERT INTO ORDERS (order_id, price, cost) 
VALUES (4, 10.75 * 6, 3.30 * 6);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES 
  (4, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4),
  (5, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4),
  (6, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4),
  (7, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4),
  (8, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4),
  (9, 10.75, 3.30, 'Completed', '2024-03-03 21:30:00', 10, 4);
INSERT INTO PIZZA_TOPPINGS (extra, pizza_id, top_id)
VALUES 
  (FALSE, 4, 7),  -- Pepperoni
  (FALSE, 4, 13),  -- Regular Cheese
  (FALSE, 5, 7),
  (FALSE, 5, 13),  
  (FALSE, 6, 7),
  (FALSE, 6, 13),  
  (FALSE, 7, 7),
  (FALSE, 7, 13),  
  (FALSE, 8, 7),
  (FALSE, 8, 13),  
  (FALSE, 9, 7),
  (FALSE, 9, 13);
INSERT INTO CUSTOMER (cust_id, name, address, phone_number) VALUES
(1, "Andrew Wilkes-Krier", "115 Party Blvd, Athens OH 45701", "7402545861");
INSERT INTO REMOTE (cust_id, order_id, pick_up)
VALUES (1, 4, TRUE);

-- -- Order 5

INSERT INTO ORDERS (order_id, price, cost)
VALUES (5, 14.50 + 17 + 14.00, 5.59 + 5.59 + 5.68);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id) VALUES 
(10, 14.50, 5.59, 'Completed', '2024-03-05 19:11:00', 14, 5),  -- X-large pepperoni and sausage
(11, 17.00, 5.59, 'Completed', '2024-03-05 19:11:00', 14, 5),  -- X-large ham and pineapple
(12, 14.00, 5.68, 'Completed', '2024-03-05 19:11:00', 14, 5);  -- X-large jalapeno and bacon
INSERT INTO PIZZA_TOPPINGS (extra, pizza_id, top_id) VALUES
(FALSE, 10, 7),  -- Pepperoni
(FALSE, 10, 8),  -- Sausage
(TRUE, 11, 9),  -- Ham
(TRUE, 11, 10),  -- Pineapple
(FALSE, 12, 11),  -- Jalapeno
(FALSE, 12, 17);  -- Bacon
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id) VALUES 
(10, 4), 
(11, 4), 
(12, 4), 
(11, 5);  -- Specialty Pizza on Ham & Pineapple pizza
INSERT INTO REMOTE (cust_id, order_id, pick_up) VALUES 
(1, 5, TRUE);

-- -- ORDER 6

-- -- Matt Engers 2
-- -- pizza 13?

INSERT INTO ORDERS (order_id, price, cost)
VALUES (6, 16.85, 7.85);
INSERT INTO CUSTOMER (cust_id, name, address, phone_number)
VALUES (2, 'Matt Engers', 'N/A', '7404749953');
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (13, 16.85, 7.85, 'Completed', '2024-03-02 17:30:00', 16, 6);  -- X-Large Gluten-Free crust(16)
INSERT INTO PIZZA_TOPPINGS (pizza_id, top_id, extra)
VALUES (13, 5, FALSE),   -- Green Pepper
       (13, 6, FALSE),   -- Onion
       (13, 7, FALSE),   -- Roma Tomatoes
       (13, 8, FALSE),   -- Mushrooms
       (13, 9, FALSE),   -- Black Olives
       (13, 16, FALSE);  -- Goat Cheese
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id)
VALUES (1, 4);  -- Specialty Pizza discount(4)
INSERT INTO REMOTE (cust_id, order_id, pick_up)
VALUES (2, 6, TRUE);

-- -- ORDER 7

INSERT INTO ORDERS (order_id, price, cost)
VALUES (7, 13.25, 3.20);
INSERT INTO CUSTOMER (cust_id, name, address, phone_number)
VALUES (3, 'Frank Turner', '6745 Wessex St, Athens OH 45701', '7402328944');
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (14, 13.25, 3.20, 'Completed', '2024-03-02 18:17:00', 9, 7);  -- Large Thin crust(9)
INSERT INTO PIZZA_TOPPINGS (pizza_id, top_id, extra)
VALUES (14, 4, FALSE),  -- Chicken
       (14, 5, FALSE),  -- Green Pepper
       (14, 6, FALSE),  -- Onion
       (14, 8, FALSE),  -- Mushrooms
       (14, 14, FALSE);  -- Four Cheese Blend
INSERT INTO REMOTE (cust_id, order_id, pick_up)
VALUES (3, 7, FALSE);

-- ORDER 8 

INSERT INTO ORDERS (order_id, price, cost)
VALUES (8, 24.00, 7.30);
INSERT INTO CUSTOMER (cust_id, name, address, phone_number)
VALUES (4, 'Milo Auckerman', '8879 Suburban Home, Athens OH 45701', '7408785679');
INSERT INTO REMOTE (cust_id, order_id, pick_up)
VALUES (4, 8, FALSE);
INSERT INTO PIZZA (pizza_id, price, cost, status, order_time, base_id, order_id)
VALUES (15, 12.00, 3.75, 'Completed', '2024-03-06 20:32:00', 9, 8),  -- Large Thin Crust (9)
       (16, 12.00, 2.55, 'Completed', '2024-03-06 20:32:00', 9, 8);  -- Large Thin Crust (9)
INSERT INTO PIZZA_TOPPINGS (pizza_id, top_id, extra)
VALUES (15, 14, TRUE),  -- 4 Cheese Blend (extra)
       (16, 13, FALSE), -- Regular Cheese
       (16, 1, TRUE);  -- Pepperoni (extra)
INSERT INTO PIZZA_DISCOUNT (pizza_id, discount_id)
VALUES (3, 1),  -- Employee discount (1)
       (4, 1);  -- Employee Discount (1)

SET FOREIGN_KEY_CHECKS = 1;
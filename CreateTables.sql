CREATE TABLE BASE_PRICE (
    base_id         INT             NOT NULL,
    size            VARCHAR(7)      NOT NULL,
    crust_type      VARCHAR(11)     NOT NULL,
    price           Decimal(10, 2) NOT NULL,
    cost            Decimal(10, 2) NOT NULL,
    CONSTRAINT BID_PK
		PRIMARY KEY(base_id)
    -- TODO contrain options
);

CREATE TABLE ORDERS (
    order_id        INT             NOT NULL,
    price           Decimal(10, 2) NOT NULL,
    cost            Decimal(10, 2) NOT NULL,
    CONSTRAINT OID_PK
		PRIMARY KEY(order_id)
);

CREATE TABLE PIZZA (
    pizza_id        INT             NOT NULL,
    price           Decimal(10, 2) NOT NULL,
    cost            Decimal(10, 2) NOT NULL,
    status          VARCHAR(11)     NOT NULL, -- Completed or still being prepared TODO?
    order_time      DATETIME        NOT NULL,
    base_id         INT             NOT NULL,
    order_id        INT             NOT NULL,
    CONSTRAINT P_PK
      PRIMARY KEY(pizza_id),
    CONSTRAINT PBID_FK
      FOREIGN KEY(base_id) REFERENCES BASE_PRICE(base_id),
    CONSTRAINT POID_FK
      FOREIGN KEY(order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE TOPPINGS (
    top_id          INT             NOT NULL,
    name            VARCHAR(20)     NOT NULL,
    unit_cost       Decimal(10, 2) NOT NULL,
    unit_price      Decimal(10, 2) NOT NULL,
    inventory_level INT             NOT NULL,
    CONSTRAINT T_PK
		  PRIMARY KEY(top_id)
);

CREATE TABLE PIZZA_TOPPINGS (
    extra           BOOLEAN         NOT NULL,
    pizza_id        INT             NOT NULL,
    top_id          INT             NOT NULL,
    CONSTRAINT PT_PK
		PRIMARY KEY(pizza_id, top_id),
    CONSTRAINT PT_PID_FK
		FOREIGN KEY(pizza_id) REFERENCES PIZZA(pizza_id),
    CONSTRAINT PT_TID_FK
		FOREIGN KEY(top_id) REFERENCES TOPPINGS(top_id)
);

CREATE TABLE TOPPING_AMOUNT (
    amount_id   INT             NOT NULL,
    amount      Decimal(4,2)    NOT NULL,
    size        VARCHAR(7)      NOT NULL,
    top_id      INT             NOT NULL,
    CONSTRAINT TA_PK
		PRIMARY KEY(amount_id),
    CONSTRAINT TID_FK
		FOREIGN KEY(top_id) REFERENCES TOPPINGS(top_id)
);

CREATE TABLE DISCOUNT (
    discount_id INT             NOT NULL,
    name        VARCHAR(20)     NOT NULL, 
    CONSTRAINT D_PK
		PRIMARY KEY(discount_id)
);

CREATE TABLE PIZZA_DISCOUNT (
    pizza_id        INT             NOT NULL,
    discount_id     INT             NOT NULL,
    CONSTRAINT PD_PK
		PRIMARY KEY(pizza_id,discount_id),
    CONSTRAINT PD_PID_FK
		FOREIGN KEY(pizza_id) REFERENCES PIZZA(pizza_id),
    CONSTRAINT PD_DID_FK
		FOREIGN KEY(discount_id) REFERENCES DISCOUNT(discount_id)
);

CREATE TABLE ORDER_DISCOUNT (
    order_id        INT             NOT NULL,
    discount_id     INT             NOT NULL,
    CONSTRAINT OD_PK
		PRIMARY KEY(order_id,discount_id),
    CONSTRAINT OID_FK
		FOREIGN KEY(order_id) REFERENCES ORDERS(order_id),
    CONSTRAINT DID_FK
		FOREIGN KEY(discount_id) REFERENCES DISCOUNT(discount_id)
);

CREATE TABLE DOLLAR_AMOUNT (
    discount_id     INT             NOT NULL,
    dollar_amount   Decimal(10, 2) NOT NULL,
    CONSTRAINT DA_PK
		PRIMARY KEY(discount_id),
    CONSTRAINT DA_DID_FK
		FOREIGN KEY(discount_id) REFERENCES DISCOUNT(discount_id)
);

CREATE TABLE PERCENTAGE (
    discount_id INT             NOT NULL,
    percentage  DECIMAL(5,2)    NOT NULL,
    CONSTRAINT P_PK
		PRIMARY KEY(discount_id),
    CONSTRAINT P_DID_FK
		FOREIGN KEY(discount_id) REFERENCES DISCOUNT(discount_id)
);

CREATE TABLE SEAT_NUMBERS (
    seat_number INT             NOT NULL,
    order_id    INT             NOT NULL,
    CONSTRAINT SN_PK
		PRIMARY KEY(order_id, seat_number),
    CONSTRAINT SN_OID_FK
		FOREIGN KEY(order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE CUSTOMER (
    cust_id         INT             NOT NULL,
    name            VARCHAR(11)     NOT NULL,
    address         VARCHAR(100)    NOT NULL,
    phone_number    VARCHAR(10)     NOT NULL,
    CONSTRAINT C_PK
		PRIMARY KEY(cust_id)
);

CREATE TABLE IN_PERSON (
    table_num       INT             NOT NULL,
    order_id        INT             NOT NULL,
    CONSTRAINT IP_PK
		PRIMARY KEY(order_id),
    CONSTRAINT IP_OID_FK
		FOREIGN KEY(order_id) REFERENCES ORDERS(order_id)
);

CREATE TABLE REMOTE (
    cust_id     INT             NOT NULL,
    order_id    INT             NOT NULL,
    pick_up     BOOLEAN         NOT NULL,
    CONSTRAINT R_PK
		PRIMARY KEY(order_id),
    CONSTRAINT R_CID_FK
		FOREIGN KEY(cust_id) REFERENCES CUSTOMER(cust_id),
    CONSTRAINT R_OID_FK
		FOREIGN KEY(order_id) REFERENCES ORDERS(order_id)
);

-- SET FOREIGN_KEY_CHECKS=0;
-- SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE "Salesperson" (
  "sales_person_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100)
);

CREATE TABLE "Invoice" (
  "invoice_id" SERIAL PRIMARY KEY,
  "car_cost" NUMERIC(10,2),
  "service_cost" NUMERIC(10,2),
  "payment_type" VARCHAR(50),
  "VIN_no" VARCHAR(100),
  "customer_id" INTEGER REFERENCES "Customer" ("customer_id"),
  "car_id" INTEGER REFERENCES "Cars" ("car_id"),
  "sales_person_id" INTEGER REFERENCES "Salesperson" ("sales_person_id")
);

CREATE TABLE "Cars" (
  "car_id" SERIAL PRIMARY KEY,
  "make" VARCHAR(100),
  "model" VARCHAR(100),
  "year" INTEGER,
  "color" VARCHAR(100),
  "is_new" BOOLEAN,
  "price" NUMERIC(10,2),
  "VIN_no" VARCHAR(100)
);

CREATE TABLE "Mechanics" (
  "mechanic_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100)
);

CREATE TABLE "Customer" (
  "customer_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(100),
  "last_name" VARCHAR(100)
);

CREATE TABLE "Service" (
  "service_id" SERIAL PRIMARY KEY,
  "VIN_no" VARCHAR(100),
  "service_type" VARCHAR(100),
  "service_cost" NUMERIC(10,2),
  "mechanic_id" INTEGER REFERENCES "Mechanics" ("mechanic_id"),
  "invoice_id" INTEGER REFERENCES "Invoice" ("invoice_id")
);

SELECT *
FROM "Customer";

INSERT INTO "Customer"(
	first_name,
	last_name
) VALUES (
	'Scooby',
	'Doo'
);

INSERT INTO "Customer"(
	first_name,
	last_name
) VALUES (
	'Shaggy',
	'Rogers'
);

INSERT INTO "Customer"(
	first_name,
	last_name
) VALUES (
	'Velma',
	'Dinkley'
);

INSERT INTO "Customer"(
	first_name,
	last_name
) VALUES (
	'Daphne',
	'Blake'
);

INSERT INTO "Customer"(
	first_name,
	last_name
) VALUES (
	'Fred',
	'Jones'
);

INSERT INTO "Salesperson"(
	first_name,
	last_name
) VALUES (
	'Puppet',
	'Master'
);

INSERT INTO "Salesperson"(
	first_name,
	last_name
) VALUES (
	'Big',
	'Ben'
);

INSERT INTO "Salesperson"(
	first_name,
	last_name
) VALUES (
	'Scrappy',
	'Doo'
);

INSERT INTO "Salesperson"(
	first_name,
	last_name
) VALUES (
	'Flim',
	'Flam'
);

INSERT INTO "Mechanics"(
	first_name,
	last_name
) VALUES (
	'Dusk',
	'Hex'
);

INSERT INTO "Mechanics"(
	first_name,
	last_name
) VALUES (
	'Thorn',
	'Hex'
);

INSERT INTO "Mechanics"(
	first_name,
	last_name
) VALUES (
	'Luna',
	'Hex'
);

INSERT INTO "Mechanics"(
	first_name,
	last_name
) VALUES (
	'Gigi',
	'Hex'
);

INSERT INTO "Service"(
 	"VIN_no",
 	service_type,
 	service_cost
) VALUES (
 	'1A2B3C',
 	'tire_rotation',
 	40.00
);

INSERT INTO "Service"(
 	"VIN_no",
 	service_type,
 	service_cost
) VALUES (
 	'4D5E6F',
 	'oil_change',
 	40.00
);

INSERT INTO "Service"(
 	"VIN_no",
 	service_type,
 	service_cost
) VALUES (
 	'7G8H9I',
 	'break_replacement',
 	40.00
);

INSERT INTO "Service"(
 	"VIN_no",
 	service_type,
 	service_cost
) VALUES (
 	'1J2K3L',
 	'filter_change',
 	40.00
);

INSERT INTO "Cars"(
 	make,
 	model,
 	"year",
	color,
	is_new,
	price,
	"VIN_no"
) VALUES (
 	'Nissan',
 	'Rogue_Sport',
 	'2022',
	'orange',
	True,
	31485.00,
	'2G4H6S'
);

INSERT INTO "Cars"(
 	make,
 	model,
 	"year",
	color,
	is_new,
	price,
	"VIN_no"
) VALUES (
 	'Nissan',
 	'Pathfinder',
 	'2022',
	'red',
	False,
	50660.00,
	'6C9F1O'
);

INSERT INTO "Cars"(
 	make,
 	model,
 	"year",
	color,
	is_new,
	price,
	"VIN_no"
) VALUES (
 	'Nissan',
 	'Rogue',
 	'2022',
	'purple',
	True,
	27360.00,
	'0C5H7K'
);

INSERT INTO "Cars"(
 	make,
 	model,
 	"year",
	color,
	is_new,
	price,
	"VIN_no"
) VALUES (
 	'Nissan',
 	'Murano',
 	'2022',
	'silver',
	False,
	33660.00,
	'6G9S3P'
);

INSERT INTO "Invoice"(
 	payment_type
)VALUES  (
 	'Visa'
);

INSERT INTO "Invoice"(
 	payment_type
)VALUES  (
 	'Master'
);

INSERT INTO "Invoice"(
 	payment_type
)VALUES  (
 	'cash'
);

INSERT INTO "Invoice"(
 	payment_type
)VALUES  (
 	'paypal'
);

SELECT *
FROM "Customer";

SELECT *
FROM "Cars";

SELECT *
FROM "Invoice";

SELECT *
FROM "Mechanics";

SELECT *
FROM "Salesperson";

SELECT *
FROM "Service";


CREATE OR REPLACE FUNCTION add_customer(customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO "Customer"
	VALUES(customer_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;
SELECT add_customer(6, 'Hex', 'Girls');

CREATE OR REPLACE FUNCTION add_mechanics(mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO "Mechanics"
	VALUES(mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;
SELECT add_mechanics(6, 'Yabba', 'Doo');

CREATE OR REPLACE FUNCTION add_salesperson(sales_person_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO "Salesperson"
	VALUES(sales_person_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;
SELECT add_salesperson(6, 'Red', 'Herring');


ALTER TABLE "Cars"
ADD COLUMN "is_serviced" BOOLEAN;



CREATE OR REPLACE PROCEDURE serviced(
	got_service BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Add late fee to customer payment amount
	UPDATE cars
	SET got_serviced = TRUE
	WHERE is_serviced = got_serviced;
	
	-- Commit the above statement inside of a transaction
	COMMIT;
	
END;
$$




-- CREATE OR REPLACE PROCEDURE assign_invoice()
-- 	LANGUAGE plpgsql
-- 	AS $$
-- 	BEGIN
		
-- 		UPDATE invoice
-- 		SET car_cost = price
-- 		WHERE car_id IN(
-- 			SELECT car_id
-- 			FROM "Cars";
-- );		
-- 		UPDATE customer
-- 		SET platinum_member = false
-- 		WHERE customer_id NOT IN(
-- 			SELECT customer_id
-- 			FROM payment
-- 			GROUP BY customer_id
-- 			HAVING sum(amount)> 200);
			
-- 			COMMIT;
-- 		END;
-- 	$$
-- CALL is_prem_membership();






DROP TABLE IF EXISTS "products_to_orders";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "products";
DROP TABLE IF EXISTS "users";

CREATE TABLE "users"(
  "id" SERIAL PRIMARY KEY,
  "firstName" VARCHAR(32) NOT NULL CHECK("firstName"!=''),
  "lastName" VARCHAR(32) NOT NULL CHECK("lastName"!=''),
  "email" VARCHAR(256) NOT NULL CONSTRAINT "uniqueEmail" UNIQUE CHECK("email"!='') ,
  "isMale" BOOLEAN NOT NULL,
  "birthday" DATE NOT NULL CHECK("birthday" < current_date),
  "height" NUMERIC(3,2) NOT NULL CONSTRAINT "checkNormalHeight" CHECK("height">=1.1 AND "height"<=2.5)
);

CREATE TABLE "products"(
  "id" SERIAL PRIMARY KEY,
  "productName" VARCHAR(32) NOT NULL CONSTRAINT "uniqueProductName" UNIQUE,
  "price" NUMERIC(10,2) NOT NULL CHECK("price" > 0),
  "currency" VARCHAR(32) NOT NULL CHECK("currency"!=''),
  "dateOfManufacture" DATE NOT NULL CONSTRAINT "checkDateOfManufacture" CHECK("dateOfManufacture" <= current_date),
  "shelfLife" VARCHAR(32),
  "amount" INTEGER CHECK("amount">0 AND "amount"<=1000)
);

CREATE TABLE "orders"(
  "id" SERIAL PRIMARY KEY,
  "userId" INT REFERENCES "users" ("id"),
  "createdAt" DATE NOT NULL CHECK("createdAt"<= current_date) DEFAULT current_date
);

CREATE TABLE "products_to_orders"(
  "productId" INT REFERENCES "products"("id"),
  "orderId" INT REFERENCES "orders"("id"),
  "amount" INT CHECK("amount" > 0),
  PRIMARY KEY ("productId","orderId")
);

INSERT INTO "products"("productName","price","currency","dateOfManufacture","shelfLife","amount")
VALUES ('Tomato', 2.0, '$', '2022-08-19',NULL, 100),
('Potato', 5.22, '$', '2022-08-31','1 month', 999),
('Carrot', 2.0, '$', '2022-08-01','1 month', 58),
('Apple', 3.0, '$', '2022-08-20',NULL, 632),
('Melon', 12.0, '$', '2022-08-15','1 week', 123);


CREATE EXTENSION IF NOT EXISTS "uuid-ossp" ;

DROP TABLE IF EXISTS "messages";
CREATE TABLE "messages"(
   "id" SERIAL PRIMARY KEY,
  -- "id" UUID NOT NULL UNIQUE DEFAULT gen_random_uuid (),
  --"id" UUID NOT NULL UNIQUE DEFAULT uuid_generate_v1 (),
  "body" VARCHAR(2048) NOT NULL CHECK("body"!=''),
  "author" VARCHAR(256) NOT NULL CHECK("author"!='') DEFAULT 'anonim',
  "isReady" BOOLEAN NOT NULL DEFAULT FALSE,
  "createdAt" TIMESTAMP NOT NULL CHECK("createdAt" <= current_timestamp) DEFAULT current_timestamp
);

INSERT INTO "messages"("author","body")
VALUES ('Elon1 Musk','hi'),
('Elon1 Musk','hi'),
('Elon1 Musk','hi');

INSERT INTO "users"("firstName","lastName","email","isMale","birthday","height")
VALUES ('Tom', 'Musk', 'musk@gmail.com', true, '1971-06-28',1.88),
('Elon', 'Musk', 'musk1@gmail.com', true, '1971-06-28',1.48),
('Acik', 'Cod', 'musk2@gmail.com', true, '1971-06-28',1.5),
('Elon', 'Musk', 'musk3@gmail.com', false, '1971-06-28', 1.88);

INSERT INTO "orders"("userId")
VALUES (1),(2),(1);

INSERT INTO "products_to_orders"("orderId","productId","amount")
VALUES (1,2,10),(1,1,1),(1,3,1),(2,3,5),(3,4,20),(3,5,10);
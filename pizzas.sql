DROP TABLE IF EXISTS "pizzas";
CREATE TABLE "pizzas"(
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(32) NOT NULL CHECK("name"!='') UNIQUE,  
  "price" NUMERIC(5,2) NOT NULL,
  "diameter" SMALLINT NOT NULL CHECK("diameter" <= 50)
);

INSERT INTO "pizzas"("name","price","diameter")
VALUES('Маргарита',50.4,18);

INSERT INTO "pizzas"("name","price","diameter")
VALUES('Карбонара',81,28);

INSERT INTO "pizzas"("name","price","diameter")
VALUES('Цезарь',149,38),('Пепперони',116,32);

UPDATE "pizzas"
SET "price" = 53
WHERE "name" = 'Маргарита';

UPDATE "pizzas"
SET "diameter" = 30
WHERE "id" = 4;

UPDATE "pizzas"
SET "price" = 130
WHERE "price" > 100
RETURNING *;

UPDATE "pizzas"
SET "diameter" = 22
WHERE "id" BETWEEN 2 AND 5;

UPDATE "pizzas"
SET "name" = '4 сыра', "price" = 180 
WHERE "name" = 'Цезарь'
RETURNING *;

SELECT *
FROM "pizzas"
WHERE "id" = 3;

SELECT *
FROM "pizzas"
WHERE "price" < 100;

SELECT *
FROM "pizzas"
WHERE "price" != 130;

SELECT "name","price","diameter"
FROM "pizzas"
WHERE "name" = 'Пепперони';

SELECT *
FROM "pizzas"
WHERE "name" = 'Маргарита';

SELECT *
FROM "pizzas"
WHERE "name" != 'Карбонара';

SELECT *
FROM "pizzas"
WHERE "diameter" = 22 AND
"price" < 150;

SELECT *
FROM "pizzas"
WHERE "diameter" BETWEEN 25 AND 33;

SELECT *
FROM "pizzas"
WHERE "diameter" > 25 AND "diameter" < 33 OR
"price" > 100 AND "price" < 200;

SELECT *
FROM "pizzas"
WHERE "diameter" = 22 OR
"price" = 180;

DELETE FROM "pizzas"
WHERE "id" = 3;

DELETE FROM "pizzas"
WHERE "name" = 'Пепперони'
RETURNING *;

DELETE FROM "pizzas"
WHERE "diameter" = 18;
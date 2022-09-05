ALTER TABLE "users"
ADD COLUMN "weight" INT CHECK("weight" BETWEEN 10 AND 250) NOT NULL DEFAULT 10;

ALTER TABLE "users"
DROP COLUMN "weight";

SELECT *
FROM "users"


UPDATE "users"
SET "weight" = "height"*100-100;

UPDATE "users"
SET "weight" = 50
WHERE "id" = 4;

UPDATE "users"
SET "weight" = 200
WHERE "height" > 2 AND
"isMale" = true;

UPDATE "users"
SET "weight" = 40
WHERE "height" < 1.5 AND
"isMale" = false
RETURNING *;

DELETE FROM "users"
WHERE "id"=1
RETURNING *;

SELECT *
FROM "users"
WHERE length("firstName") = 7 OR 
(extract("months" from "birthday") = 7 AND
extract("days" from "birthday") = 7);


SELECT *
FROM (SELECT length(concat("firstName","lastName")) AS "length",
concat("firstName",' ',"lastName") AS "fullName"
FROM "users") AS "LFN"
WHERE "length" >= 20; 
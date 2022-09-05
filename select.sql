
SELECT *
FROM "users"
WHERE "height"<1.6 AND "isMale"=true;

SELECT *
FROM "users"
WHERE "firstName" IN ('David','Ava','Alex');

SELECT *
FROM "users"
WHERE "height">=1.7 AND "height"<=1.8;

SELECT *
FROM "users"
WHERE "height" BETWEEN 1.7 AND 1.8;

SELECT "email","birthday","firstName"
FROM "users"
WHERE "firstName" IN ('Dennis','Ava','Eva','Lucas');

SELECT *
FROM "users"
WHERE "isMale"=true AND
age("birthday") BETWEEN make_interval(20) AND make_interval(25) AND
"height"=1.88;

SELECT *
FROM "users"
WHERE extract("years" from age("birthday")) = 38;

SELECT *
FROM "users"
WHERE extract("months" from "birthday") = 5;

SELECT *
FROM "users"
WHERE age("birthday")>make_interval(40) AND 
extract("days" from "birthday") = 13;

SELECT *
FROM "users"
WHERE extract("years" from age("birthday")) >40 AND 
extract("days" from "birthday") = 13;

SELECT "firstName" || ' ' || "lastName" AS "fullName"
FROM "users"
LIMIT 5
OFFSET 5;


SELECT concat("firstName",' ',"lastName") AS "fullName"
FROM "users"
WHERE length(concat("firstName",' ',"lastName")) < 10;

SELECT *
FROM (
  SELECT concat("firstName",' ',"lastName") AS "fullName"
  FROM "users"
) AS "fn"
WHERE length("fullName") <= 10;


SELECT *
FROM(
  SELECT extract("years" from age("birthday")) AS "полный возраст","email" AS "почта","isMale" AS "пол"
  FROM "users"
  ) AS "a"
  WHERE "пол"=false AND ("полный возраст") BETWEEN 28 AND 30;

SELECT *
FROM(
  SELECT "birthday" AS "дата рождения",concat("firstName",' ',"lastName") AS "полное имя","height" AS "рост"
  FROM "users"
  ) AS "a"
  WHERE extract("months" from "дата рождения") IN (6,7,8) AND
  "рост" < 1.6;

SELECT "birthday" AS "дата рождения",
concat("firstName",' ',"lastName") AS "полное имя",
"height" AS "рост"
FROM "users"
 WHERE extract("months" from "birthday") IN (6,7,8) AND
  "height" < 1.6
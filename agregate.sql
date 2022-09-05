
SELECT sum("weight") 
FROM"users"
WHERE "isMale" = true;

SELECT avg("weight"),
"lastName"
FROM "users"
GROUP BY "lastName";

SELECT sum("weight"),
extract("years" from "birthday")
FROM "users"
GROUP BY extract("years" from "birthday");

SELECT count(*),
extract("years" from "birthday")
FROM "users"
GROUP BY extract("years" from "birthday");

SELECT count(*),"isMale"
FROM "users"
GROUP BY "isMale";

SELECT avg("height"),"isMale"
FROM "users"
GROUP BY "isMale";

-- SELECT count(*)
-- FROM "users"
-- WHERE (extract("days" from "birthday") = 1 AND 
-- extract("months" from "birthday") = 1)

SELECT count(*),extract("days" from "birthday"), extract("months" from "birthday")
FROM "users"
WHERE (extract("days" from "birthday") = 1 AND extract("months" from "birthday") = 1)
GROUP BY extract("days" from "birthday"), extract("months" from "birthday")

SELECT count(*),"firstName" 
FROM "users"
WHERE "firstName" IN ('Nicole','Noah')
GROUP BY "firstName" ;

SELECT sum("weight"),"firstName"
FROM "users"
WHERE "firstName" = 'Noah'
GROUP BY "firstName";

SELECT count(*), "isMale"
FROM "users"
WHERE "isMale" = true AND
"height" > 1.89
GROUP BY "isMale"

SELECT sum("height"), "isMale"
FROM "users"
WHERE "isMale" = false AND
"weight" < 40
GROUP BY "isMale";

SELECT avg("weight"), extract("years" from "birthday")
FROM "users"
WHERE extract("years" from "birthday") = 2000
GROUP BY extract("years" from "birthday");

SELECT avg("height"), "isMale", extract("month" from "birthday")
FROM "users"
WHERE "isMale" = true AND 
extract("month" from "birthday") = 8
GROUP BY "isMale", extract("month" from "birthday");
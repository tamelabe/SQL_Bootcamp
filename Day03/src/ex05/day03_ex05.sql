WITH visited AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_visits ON person.id = person_visits.person_id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'),
    ordered AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = 'Andrey'),
    vo AS (
    SELECT * FROM visited
    EXCEPT
    SELECT * FROM ordered),
    ov AS (
    SELECT * FROM ordered
    EXCEPT
    SELECT * FROM visited)
SELECT pizzeria_name
FROM vo
UNION
SELECT pizzeria_name
FROM ov
ORDER BY pizzeria_name
;
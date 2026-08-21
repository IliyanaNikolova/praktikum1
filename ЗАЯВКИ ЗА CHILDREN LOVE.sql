use LoveChildren

--1. Кой учител, коя група води
SELECT name_teacher,name_group
FROM Teachers 
JOIN Groups
ON Teachers.id_teacher=Groups.teacher_id
GROUP BY name_teacher,name_group

--2. Кой учител в кой ден от седмицата е зает
SELECT name_teacher, day_event
FROM Teachers as t
JOIN Groups as g
ON t.id_teacher=g.teacher_id
GROUP BY name_teacher, day_event

--3. Кои преподаватели работят в сряда
SELECT name_teacher, day_event
FROM Teachers as t
JOIN Groups as g
ON t.id_teacher=g.teacher_id
WHERE day_event='сряда'

--4. Кои преподаватели работят вторник и четвъртък
SELECT name_teacher, day_event
FROM Teachers as t
JOIN Groups as g
ON t.id_teacher=g.teacher_id
WHERE day_event='вторник' OR day_event='четвъртък'

--5. Кои кръжоци се провеждат от 18 часа
SELECT name_group, hour_event
FROM Groups 
WHERE hour_event='18:00'

--6. Кои кръжоци се провеждат от 18 часа, в кой ден и с кой преподавател
SELECT name_group, hour_event, day_event, name_teacher
FROM Groups
JOIN Teachers
ON Groups.teacher_id=Teachers.id_teacher
WHERE hour_event='18:00'

--7. Да се изведат имената на децата по групи
SELECT name_child, name_group
FROM Children as c
JOIN Children_groups as cg
ON c.id_children=cg.children_id
JOIN Groups as g
ON g.id_group=cg.group_id
GROUP BY name_group, name_child

--8. Колко деца са в група „Млад художник“
SELECT name_group, COUNT(name_child)
FROM Children as ch
JOIN Children_groups as cg
ON ch.id_children=cg.children_id
JOIN Groups as g
ON cg.group_id= g.id_group
WHERE name_group='Млад художник'
GROUP BY name_group

--9. Виктория Петкова кои групи посещава и кой й е учител
SELECT name_child, name_group, name_teacher
FROM Children 
JOIN Children_groups as cg
ON Children.id_children=cg.children_id
JOIN Groups as g
ON g.id_group=cg.group_id
JOIN Teachers as t
ON t.id_teacher = g.teacher_id
WHERE name_child='Виктория Петкова' 
GROUP BY name_child, name_group, name_teacher

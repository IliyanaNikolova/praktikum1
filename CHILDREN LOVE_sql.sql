CREATE DATABASE LoveChildren

use LoveChildren

CREATE TABLE Teachers
(id_teacher int PRIMARY KEY,
name_teacher nvarchar(30),
specialty_teacher nvarchar(40))


CREATE TABLE Groups
(id_group int PRIMARY KEY,
name_group nvarchar(50),
day_event nvarchar(20),
hour_event time,
teacher_id int FOREIGN KEY REFERENCES Teachers(id_teacher))

CREATE TABLE Children
(id_children int PRIMARY KEY,
name_child nvarchar(40),
age_child int CONSTRAINT AGE CHECK (age_child>=10))

CREATE TABLE Children_groups
(group_id int FOREIGN KEY REFERENCES Groups(id_group),
children_id int FOREIGN KEY REFERENCES Children(id_children))

INSERT Teachers
VALUES (1,N'Иван Петров', 'изобразително изкуство'),
		(2,N'Румяна Петкова','информатика'),
		(3,N'Кирил Иванов', 'електро инженер'),
		(4,N'Христо Христов','педагогика на музиката')

INSERT Groups
VALUES (1, N'Млад художник',N'понеделник', '17:00',1),
       (2,N'Изкуството в действие',N'сряда','17:00',1),
	   (3, N'Млад програмист',N'вторник','17:30', 2),
	   (4,N'Аз програмирам игрите си', N'четвъртък','17:30',2),
	   (5, N'Роботика', N'петък', '17:00',3),
	   (6,N'Музиката е моя живот',N'петък','18:00',4)

INSERT Children
VALUES (1, N'Ангел Иванов',10),
        (2, N'Антон Атонов',10),
		(3, N'Васил Василев',12),
		(4, N'Борис Борисов',10),
		(5, N'Борислав Алеков',12),
		(6, N'Виктория Петкова',11),
		(7, N'Велислава Василева',10),
		(8, N'Гергана Георгиева',11),
		(9, N'Дима Димова',13),
		(10, N'Доника Колева',10),
		(11, N'Елена Петрова',11),
		(12, N'Ива Димитрова',10),
		(13, N'Мария Петкова',14),
		(14, N'Мартин Гигов',12)

INSERT Children_groups
VALUES (1,1),(1,5),(1,6),(1,9),(1,14),(2,1),(2,6),(2,13),(2,10),
        (3,3),(3,4),(3,7),(3,11),(3,5),(4,3),(4,7),(4,11),(4,12),
		(5,2),(5,4),(5,7),(6,14),(6,8),(6,9),(6,10),(6,12),(6,13)




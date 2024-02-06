SELECT * from person; /* выбирать все значения из таблицы person */
SELECT name, surname FROM person; /* выбирать name и surname столбцы из таблицы person */
SELECT name, surname FROM person WHEN id = 0; /* выбирать name и surname столбцы из таблицы person когда id равно 0 */
SELECT name, surname FROM person WHEN age BETWEEN 14 AND 46; /*  выбирать name и surname столбцы из таблицы person когда age между 14 и 46*/
SELECT name, surname FROM person WHEN name != 'Yulai' and  age BETWEEN 14 and 46; /* выбирать name и surname столбцы из таблицы person когда age между 14 и 46, и name не равно yulai*/
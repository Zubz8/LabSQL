####
1. Напишите оператор SQL, чтобы создать простую таблицу стран, включая столбцы country_id, country_name и region_id.
CREATE TABLE countries(
    COUNTRY_ID varchar(5),
    COUNTRY_NAME varchar(69),
    REGION_ID decimal(9,0)
);
2.Напишите оператор SQL, чтобы создать таблицу «countries» которая уже существует. Необходимо получить ошибку ERROR:  relation "countries" already exists
CREATE TABLE Countries(
);

3. Напишите оператор SQL для создания таблицы «dup_countries», структура которой аналогична таблице «countries». Указывать структуру таблицы явно запрещено — необходимо ссылаться на таблицу «countries».
CREATE TABLE dup_countries(
	country_id varchar(2),
	country_name varchar(100),
	region_id decimal(10,0)
4.Напишите оператор SQL для копирования таблицы «countries», включая структуру и данные. Имя копии - «dup_countries».

CREATE TABLE IF NOT EXISTS dup_countries
AS SELECT * FROM  Countries;

5. Напишите оператор SQL, чтобы создать таблицу стран «countries», если такой таблицы ещё нет.
CREATE TABLE IF NOT EXISTS Countries

6. Напишите оператор SQL, чтобы создать таблицу «jobs» со столбцами «job_id», «job_title», «min_salary», «max_salary». В «max_salary» должна быть проверка на то, что значения в этом столбце не превышают 25000.
CREATE TABLE IF NOT EXISTS jobs (
    JOB_ID varchar(10) NOT NULL ,
    JOB_TITLE varchar(35) NOT NULL,
    MIN_SALARY decimal(6,0),
    MAX_SALARY decimal(6,0)
    CHECK(MAX_SALARY<=25000)
);

7. Напишите оператор SQL, чтобы создать таблицу «countries» со столбцами «country_id», «country_name» и «region_id». В «country_name» должна быть запрещена вставка значений, кроме Italy, India и China.
CREATE TABLE IF NOT EXISTS countries (
    COUNTRY_ID varchar(5),
    COUNTRY_NAME varchar(69)
    CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
    REGION_ID decimal(9,0)

8. Напишите оператор SQL, чтобы создать таблицу «countries» со столбцами «country_id», «country_name» и «region_id». В «country_id» должна быть проверка на уникальность значений для каждой строки.

CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(5) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(69) DEFAULT NULL,
REGION_ID decimal(9,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

9. Напишите оператор SQL, чтобы создать таблицу «jobs» со столбцами «job_id», «job_title», «min_salary» и «max_salary». Значения для по умолчанию для столбцов:
•	job_title — пустая строка
•	min_salary — 8000
•	max_salary — NULL


CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID varchar(10) NOT NULL UNIQUE, 
JOB_TITLE varchar(25) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(5,0) DEFAULT 8000, 
MAX_SALARY decimal(5,0) DEFAULT NULL
);


10. Напишите оператор SQL, чтобы создать таблицу «countries» со столбцами «country_id», «country_name» и «region_id». Столбец «country_id» будет первичным ключём, и значения в нём будут уникальными. 

CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID));

11 Напишите оператор SQL для создания таблицы «countries» со столбцами «country_id», 
«country_name» и «region_id». Данные в «country_id» будут уникальными, и будут авто-инкрементироваться.
CREATE TABLE IF NOT EXISTS countries ( 
 COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY, 
 COUNTRY_NAME varchar(40) NOT NULL, 
 REGION_ID decimal(10,0) NOT NULL 
);



12 Напишите оператор SQL для создания таблицы «countries» со столбцами «country_id», 
«country_name» и «region_id». Комбинация столбцов country_id и region_id должна быть уникальной.

CREATE TABLE IF NOT EXISTS countries (
COUNTRY_ID varchar(5) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(69) DEFAULT NULL,
REGION_ID decimal(9,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

 13 .Напишите оператор SQL для создания таблицы «job_history», со столбцами «employee_id», «start_date», «end_date», «job_id» и «department_id». У столбца «employee_id» должна быть проверка на уникальность значений.
 Столбец «job_id» должен быть внешним ключём, и должен содержать только те значения, которые существуют в таблице «jobs».

CREATE TABLE IF NOT EXISTS job_history (
    EMPLOYEE_ID decimal(5,0) NOT NULL,
    START_DATE date NOT NULL,
    END_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    DEPARTMENT_ID decimal(4,0) NOT NULL

14 Напишите оператор SQL для создания таблицы «employees» с столбцами
 «employee_id», «first_name», «last_name», «email», «phone_number», «hire_date», «job_id», «salary», «commission», «manager_id» и «department_id».
 Cтолбец «employee_id» должен содержать проверку на уникальность значений. Столбцы «department_id» и «manager_id» должны:

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
);

15 Напишите оператор SQL для создания таблицы 
«employees» с столбцами «employee_id», «first_name», «last_name», «email», «phone_number», «hire_date», «job_id», «salary», «commission», «manager_id» и «department_id».

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID) 
REFERENCES  departments(DEPARTMENT_ID),
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID));

 16 Напишите оператор SQL для создания таблицы «employees» c столбцами «employee_id», «first_name», «last_name», «job_id», «salary».

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL,
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL,
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID));


17. Напишите оператор SQL для создания таблицы «employees», со столбцами «employee_id», «first_name», «last_name», «job_id», «salary». В столбце «employee_id» должна быть проверка на уникальность значений

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL,
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL,
FOREIGN KEY(JOB_ID) 
REFERENCES  jobs(JOB_ID));


18 Напишите оператор SQL для создания таблицы «employees», со столбцами «employee_id», «first_name», «last_name», «job_id», «salary». В столбце «employee_id» должна быть проверка на уникальность значений.

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) 
REFERENCES departments(DEPARTMENT_ID,MANAGER_ID) 
)ENGINE=InnoDB;




19 Напишите оператор SQL для создания таблицы «employees», со столбцами «employee_id», «first_name», «last_name», «job_id», «salary».

CREATE TABLE IF NOT EXISTS employees ( 
EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY, 
FIRST_NAME varchar(20) DEFAULT NULL, 
LAST_NAME varchar(25) NOT NULL, 
EMAIL varchar(25) NOT NULL, 
PHONE_NUMBER varchar(20) DEFAULT NULL, 
HIRE_DATE date NOT NULL, 
JOB_ID varchar(10) NOT NULL, 
SALARY decimal(8,2) DEFAULT NULL, 
COMMISSION_PCT decimal(2,2) DEFAULT NULL, 
MANAGER_ID decimal(6,0) DEFAULT NULL, 
DEPARTMENT_ID decimal(4,0) DEFAULT NULL, 
FOREIGN KEY(DEPARTMENT_ID) 
REFERENCES departments(DEPARTMENT_ID), 
FOREIGN KEY(JOB_ID) 
REFERENCES jobs(JOB_ID) 
)ENGINE=InnoDB;


20 Напишите оператор SQL, чтобы переименовать таблицу «countries» в «country_new».

ALTER TABLE countries RENAME TO country_new;

21 Напишите оператор SQL, чтобы добавить столбец «region_id» в таблицу «locations».
ALTER TABLE locations
ADD region_id  INT;

22 Напишите оператор SQL, чтобы изменить тип данных столбца «region_id» на текстовый в таблице «locations».
ALTER TABLE locations
ALTER region_id TYPE text;

23 Напишите оператор SQL, чтобы столбец «city» из таблицы «locations».

ALTER TABLE locations
ADD city INT;

24 Напишите инструкцию SQL, чтобы переименовать столбец «state_province» в «state», сохранив тип и размер данных прежними.
ALTER TABLE locations
ADD location state_provinance (30);

25 Напишите оператор SQL, чтобы добавить первичный ключ для столбца «location_id» в таблице «locations». 
ALTER TABLE locations
ADD PRIMARY KEY(location_id);

26 Напишите оператор SQL, чтобы добавить первичный ключ для комбинации столбцов «location_id» и «country_id» в таблице «locations».

ALTER TABLE locations
ADD PRIMARY KEY(location_id,region_id);

27 Напишите оператор SQL, чтобы удалить существующий первичный ключ из таблицы «locations», состоящий из столбцов «location_id» и «country_id».

ALTER TABLE locations 
DROP CONSTRAINT locations_pkey;

28 Напишите оператор SQL, чтобы добавить внешний ключ в столбец «job_id» таблицы «job_history», ссылающийся на первичный ключ «job_id» таблицы «jobs».

ALTER TABLE job_history 
ADD CONSTRAINT fk_job_id 
FOREIGN KEY (job_id) 
REFERENCES jobs(job_id)


29 Напишите инструкцию SQL, чтобы добавить ограничение внешнего ключа «fk_job_id» в столбец «job_id» таблицы «job_history», ссылающееся на первичный ключ «job_id» таблицы «jobs».
ALTER TABLE job_history
ADD FOREIGN KEY(job_id)
REFERENCES jobs(job_id);


30 Напишите оператор SQL, чтобы удалить существующий внешний ключ «fk_job_id» из таблицы «job_history» в столбце «job_id», который ссылается на job_id таблицы заданий.

ALTER TABLE job_history
DROP FOREIGN KEY fk_job_id

31 Напишите оператор SQL, чтобы добавить индекс с именем «index_job_id» в столбце «job_id» в таблице job_history.

CREATE UNIQUE INDEX CONCURRENTLY index_job_id ON job_history(job_id);
ALTER TABLE job_history ADD CONSTRAINT index_job_id PRIMARY KEY USING INDEX index_job_id;

32 Напишите оператор SQL, чтобы удалить индекс «indx_job_id» из таблицы «job_history».
ALTER TABLE job_history
DROP INDEX indx_job_id;

33 Напишите оператор SQL, чтобы изменить столбец «email» в таблице «employees» на «not available» для всех сотрудников.
UPDATE employees SET email='not available'

34 Напишите оператор SQL, чтобы изменить столбцы столбец «email» и «commission_pct» в таблице «employees» на «not available» и «0,10» для всех сотрудников.
UPDATE employees SET email='not available'


35 Напишите оператор SQL, чтобы изменить столбцы столбец «email» и «commission_pct» в таблице «employees» на «not available» и «0,10» для тех сотрудников, чей «department_id» равен 110.

UPDATE employees
SET email='Not Available',
Commission_pct=0.10
WHERE Department_id=110;

36 . Напишите оператор SQL, чтобы изменить столбцы столбец «email» в таблице «employees» на «not available» для тех сотрудников, чей «department_id» равен «80» и получает комиссию менее 20%.

UPDATE employees 
SET email='not available'
WHERE department_id=80 AND commission_pct<.20;


37 . Напишите оператор SQL, ччтобы изменить столбцы столбец «email» в таблице «employees» на «not available» для тех сотрудников, которые принадлежат к отделу «Accounting».


UPDATE employees 
SET email='not available'
WHERE department_id=(
SELECT department_id 
FROM departments 
WHERE department_name='Accounting');



38 Напишите оператор SQL, чтобы изменить зарплату сотрудника на «8000» с идентификатором «105», если существующая зарплата меньше «5000».


UPDATE employees SET SALARY = 8000 WHERE employee_id = 105 AND salary < 5000;



39 Напишите оператор SQL, чтобы изменить «job_id» сотрудника с ID «118» на «SH_CLERK», если сотрудник принадлежит к отделу с ID «30» и существующий «job_id» не начинается с SH.

UPDATE employees SET JOB_ID= 'SH_CLERK' 
WHERE employee_id=118 
AND department_id=30 
AND NOT JOB_ID LIKE 'SH%';




40 Напишите оператор SQL для увеличения заработной платы сотрудников в отделах
 «40», «90» и «110» в соответствии с правилами компании, согласно которым заработная плата будет увеличена на 25% для отдела «40», 15% для отдела «90» и 10% для отдела «110».
 и остальная часть отдела останется прежней.

1.	UPDATE EMPLOYEES
SET SALARY=SALARY*1.25
WHERE EMPLOYEE_id='40'

2.	UPDATE EMPLOYEES
SET SALARY=SALARY*1.15






















































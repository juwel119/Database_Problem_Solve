drop table meve_employee
drop table meve_works

create table meve_employee (employee_name varchar(20), street varchar(20), city varchar(10), primary key(employee_name))

create table meve_works (employee_name varchar(20), company_name varchar(20), salary number(8), foreign key(employee_name) references meve_employee(employee_name))

insert into meve_employee values('Arif', '51 Uposohor', 'Rajshahi')
insert into meve_employee values('Sumon', '12 East', 'Moynamati')
insert into meve_employee values('Sagor', 'Neemgacci', 'Sirajgong')
insert into meve_employee values('Abdul', 'Bindopur', 'Rajshahi')
insert into meve_employee values('Himesh', 'Nazrul Aveneu', 'Dhaka')
insert into meve_employee values('Amirul', 'Chawk Bazar', 'Sylhet')
insert into meve_employee values('Sajib', '99 North', 'Chittagong')

select * from meve_employee

insert into meve_works values('Sumon', 'Agrani', 12000)
insert into meve_works values('Abdul', 'Sonali', 13000)
insert into meve_works values('Himesh', 'Agrani', 6000)
insert into meve_works values('Amirul', 'Sonali', 20000)
insert into meve_works values('Sagor', 'Sonali', 8000)
insert into meve_works values('Arif', 'Janata', 13000)
insert into meve_works values('Sajib', 'Janata', 9000)

select * from meve_works

select employee_name from meve_employee where city= 'Rajshahi'
select employee_name, street from meve_employee where city= 'Rajshahi'
select employee_name, company_name from meve_works where company_name='Sonali' or company_name='Agrani' or company_name='Janata' order by employee_name
select employee_name, salary, company_name from meve_works where company_name='Sonali' or company_name='Agrani' or company_name='Janata' order by employee_name
select employee_name from meve_works where salary= 12000 or salary >=12000 or salary<12000 order by employee_name

SELECT me.EMPLOYEE_NAME, me.STREET , me.CITY FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND company_name = 'Agrani'
SELECT me.EMPLOYEE_NAME, me.STREET , me.CITY FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND SALARY>=10000
SELECT me.EMPLOYEE_NAME , mw.COMPANY_NAME , mw.SALARY FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND city= 'Rajshahi'
SELECT me.EMPLOYEE_NAME, me.STREET , me.CITY, mw.COMPANY_NAME FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND SALARY>=10000

SELECT me.EMPLOYEE_NAME, me.STREET , me.CITY FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND COMPANY_NAME= 'Sonali' AND SALARY>=12000
SELECT * FROM MEVE_EMPLOYEE me CROSS JOIN MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND COMPANY_NAME !='Sonali'

UPDATE MEVE_EMPLOYEE SET CITY = 'Natore' WHERE EMPLOYEE_NAME = 'Arif'   --SELECT * FROM MEVE_EMPLOYEE me WHERE EMPLOYEE_NAME = 'Arif'

UPDATE MEVE_WORKS SET SALARY = SALARY + (SALARY*(10/100)) WHERE COMPANY_NAME = 'Agrani'   --SELECT * FROM MEVE_WORKS

DELETE FROM MEVE_EMPLOYEE WHERE EMPLOYEE_NAME = 'Sagor'

ALTER TABLE MEVE_WORKS ADD manager varchar(20)

SELECT  me.EMPLOYEE_NAME , street, city FROM  MEVE_EMPLOYEE me , MEVE_WORKS mw WHERE me.EMPLOYEE_NAME = mw.EMPLOYEE_NAME AND company_name = 'Agrani'






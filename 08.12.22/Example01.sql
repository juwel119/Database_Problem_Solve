drop table meve_student
DROP TABLE meve_studentInfo 

create table meve_student (roll number(20), name varchar(20), dept varchar(10), year varchar(5), semester varchar(5), primary key (roll))

insert into meve_student values(06543201, 'Rahim', 'BBA', '2nd', '1st')
insert into meve_student values(06543202, 'Karim', 'ICE', '2nd', '1st')
insert into meve_student values(06543203, 'Motin', 'CSE', '1st', '2nd')
insert into meve_student values(05654456, 'Swadhin', 'CSE', '1st', '2nd')
insert into meve_student values(05654457, 'Hena', 'BBA', '4th', '2nd')
insert into meve_student values(05654458, 'Sohag', 'CSE', '3rd', '1st')

select * from meve_student


create table meve_studentInfo (roll number(20), name varchar(20), fatherName varchar(20), address varchar(20), mobile varchar(11), primary key (roll))

insert into meve_studentInfo values(06543201, 'Rahim', 'Ataur', 'Rajshahi', '01719201233')
insert into meve_studentInfo values(06543202, 'Karim', 'Tareq', 'Dhaka', '01719202020')
insert into meve_studentInfo values(06543203, 'Motin', 'Rahman', 'Khulna', '01719202678')
insert into meve_studentInfo values(05654456, 'Swadhin', 'Fazlu', 'Rajshahi', '01716204564')
insert into meve_studentInfo values(05654457, 'Hena', 'Rahman', 'Rajshahi', '01119212020')
insert into meve_studentInfo values(05654458, 'Sohag', 'Fazlul', 'Natore', '01719202222')

select * from meve_studentInfo


select name from meve_student where semester ='1st'
select name from meve_student where year='2nd'
select name from meve_student where dept= 'CSE'
select name from meve_student where roll= 06543201

select name, address, mobile from meve_studentInfo where fatherName= 'Rahman'
select name, address, mobile from meve_studentInfo where mobile= '01719202020'
select name, address, mobile from meve_studentInfo where address= 'Rajshahi'
select name, address, mobile from meve_studentInfo where address= 'Rajshahi' and fatherName= 'Rahman'
select name, address, mobile from meve_studentInfo where roll= 05654456

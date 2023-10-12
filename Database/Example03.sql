DROP TABLE meve_person
DROP TABLE meve_owns
DROP TABLE meve_car
DROP TABLE meve_log
DROP TABLE meve_accident


CREATE TABLE meve_person (nid varchar(10), name varchar(10), address varchar(10), PRIMARY KEY (nid))
CREATE TABLE meve_car (licence varchar(10), YEAR NUMBER(5), model varchar(10), PRIMARY KEY(licence))
CREATE TABLE meve_owns (nid varchar(10), licence varchar(10), PRIMARY key(nid, licence), FOREIGN KEY(nid) REFERENCES meve_person(nid), FOREIGN KEY(licence) REFERENCES meve_car(licence))
CREATE TABLE meve_accident (acc_date DATE, driver varchar(10), ammount NUMBER(10),PRIMARY KEY(acc_date, driver))
CREATE TABLE meve_log (licence varchar(10), log_date DATE, driver varchar(10), PRIMARY KEY(licence, log_date, driver), FOREIGN KEY (log_date, driver) REFERENCES meve_accident(acc_date, driver))


INSERT INTO meve_person VALUES ('123451', 'Arif', 'Rajshahi') INSERT INTO meve_person VALUES ('123452', 'Sumon', 'Maynamati') INSERT INTO meve_person VALUES ('123453', 'Sagor', 'Sirajgang') INSERT INTO meve_person VALUES ('123454', 'Abdul', 'Rajshahi') INSERT INTO meve_person VALUES ('123455', 'Himesh', 'Dhaka') INSERT INTO meve_person VALUES ('123456', 'Amirul', 'Sylhet') INSERT INTO meve_person VALUES ('123457', 'Sajib', 'Chittagong')
INSERT INTO meve_owns VALUES ('123451','11-3000') INSERT INTO meve_owns VALUES ('123452','12-4000') INSERT INTO meve_owns VALUES ('123453','12-5000') INSERT INTO meve_owns VALUES ('123454','11-5000') INSERT INTO meve_owns VALUES ('123455','11-6000') INSERT INTO meve_owns VALUES ('123456','12-6000') INSERT INTO meve_owns VALUES ('123457','12-3000')
INSERT INTO meve_car VALUES ('12-3000', 2012, 'Axio') INSERT INTO meve_car VALUES ('11-3000', 2008, 'Corolla') INSERT INTO meve_car VALUES ('12-4000', 2013, 'Axio') INSERT INTO meve_car VALUES ('12-5000', 2013, 'Premio') INSERT INTO meve_car VALUES ('11-5000', 2010, 'Nano') INSERT INTO meve_car VALUES ('11-6000', 2011, 'Alto') INSERT INTO meve_car VALUES ('12-6000', 2015, 'Nano Twist')
INSERT INTO meve_log VALUES ('11-3000', '12-Jan-13', 'Arif') INSERT INTO meve_log VALUES ('12-4000', '25-Sep-15', 'Komol') INSERT INTO meve_log VALUES ('11-6000', '20-Jun-14', 'Bahadur') INSERT INTO meve_log VALUES ('11-5000', '20-Dec-11', 'Abdul') INSERT INTO meve_log VALUES ('12-6000', '19-Sep-15', 'Akter') INSERT INTO meve_log VALUES ('11-3000', '15-May-13', 'Arif') INSERT INTO meve_log VALUES ('11-3000', '20-Aug-14', 'Arif')
INSERT INTO meve_accident VALUES ('12-Jan-13', 'Arif', 10000) INSERT INTO meve_accident VALUES ('25-Sep-15', 'Komol', 12000) INSERT INTO meve_accident VALUES ('20-Jun-14', 'Bahadur', 11000) INSERT INTO meve_accident VALUES ('20-Dec-11', 'Abdul', 8000) INSERT INTO meve_accident VALUES ('19-Sep-15', 'Akter', 70000) INSERT INTO meve_accident VALUES ('15-May-13', 'Arif', 2000) INSERT INTO meve_accident VALUES ('20-Aug-14', 'Arif', 15000)


/*(b)*/SELECT name FROM MEVE_PERSON WHERE address= 'Rajshahi'
/*(c)*/SELECT model FROM MEVE_CAR WHERE YEAR= '2013'
/*(d)*/SELECT ma.driver FROM MEVE_LOG ml, MEVE_ACCIDENT ma WHERE ml.log_date= ma.acc_date AND ml.driver= ma.driver AND  ammount BETWEEN 10000 AND 15000
/*(e)*/SELECT mo.nid FROM MEVE_OWNS mo, MEVE_CAR mc WHERE mo.licence= mc.licence AND MODEL = 'Axio'
/*(f)*/SELECT name, address FROM MEVE_PERSON mp, MEVE_OWNS mo, MEVE_CAR mc WHERE mp.nid= mo.nid AND mo.licence= mc.licence AND model= 'Alto'
/*(g)*/SELECT driver FROM MEVE_LOG WHERE log_date= '20-Dec-11'
/*(h)*/SELECT name FROM MEVE_PERSON mp, MEVE_OWNS mo WHERE mp.nid= mo.nid AND licence= '12-4000'
/*(i)*/SELECT DISTINCT name FROM MEVE_PERSON mp, MEVE_OWNS mo, MEVE_LOG ml WHERE mp.nid= mo.nid AND mo.licence= ml.licence AND driver= 'Arif'
/*(j)*/SELECT model FROM MEVE_OWNS mo, MEVE_CAR mc, MEVE_LOG ml, MEVE_ACCIDENT ma WHERE mo.licence= mc.licence AND mo.licence= ml.licence AND ml.log_date= ma.acc_date AND acc_date= '19-Sep-15'
/*(k)*/SELECT COUNT(*) AS number_of_accidents FROM MEVE_ACCIDENT WHERE driver= 'Arif' 
/*(l)*/SELECT acc_date FROM MEVE_PERSON mp, MEVE_OWNS mo, MEVE_LOG ml, MEVE_ACCIDENT ma WHERE mp.nid= mo.nid AND mo.licence= ml.licence AND ml.log_date= ma.acc_date AND name= 'Arif'
/*(m)*/UPDATE MEVE_PERSON SET address= 'Natore' WHERE name= 'Arif'


SELECT * FROM meve_person
SELECT * FROM meve_owns
SELECT * FROM meve_car
SELECT * FROM meve_log
SELECT * FROM meve_accident


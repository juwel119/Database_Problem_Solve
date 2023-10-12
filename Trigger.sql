CREATE TABLE account (acc_name varchar(50), acc_number NUMBER(10,2), balance NUMBER(10,2) )
INSERT INTO account VALUES ('Dipto', 9362, 1000)
INSERT INTO account VALUES ('Amit', 8265, 2000)

CREATE TABLE audit_account (acc_name varchar(50), acc_number NUMBER(10,2), balance number(10,2), operation varchar(50), opp_date DATE)
CREATE OR REPLACE TRIGGER check_balance
	BEFORE UPDATE OF balance
	ON account
	FOR EACH ROW
	
DECLARE 
	new_balance NUMBER(10,2);
	
BEGIN 
	new_balance:= :new.balance;
	IF new_balance < 0
		THEN raise_application_error(-20001, 'Balance can not be negative.');
	END IF;
END;
UPDATE account SET balance = balance -2000 WHERE BALANCE = 1000





CREATE OR REPLACE TRIGGER audit_trail
	AFTER UPDATE OR DELETE ON account
	FOR EACH ROW
	
DECLARE 
	balance NUMBER(10,2);
	operation varchar(50);
	acc_name varchar(50);
	acc_number varchar(50);
	
BEGIN
	IF updating 
		THEN operation:= 'Update'; 
	END IF;

	IF deleting 
		THEN operation:= 'Delete'; 
	END IF;

	balance:= :OLD.balance;
	acc_name:= :OLD.acc_name;
	acc_number:= :OLD.acc_number;

	INSERT INTO audit_account VALUES ( acc_name, acc_number, balance, operation, sysdate );
END;

UPDATE account SET balance= balance-10 WHERE acc_name= 'Dipto';
DELETE FROM account WHERE acc_name= 'Amit'



SELECT * FROM audit_account
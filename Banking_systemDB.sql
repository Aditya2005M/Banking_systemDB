use banking_system;
CREATE table CUSTOMERS(
CUSTOMERID int,
FIRSTNAME varchar(50),
LASTNAME varchar(50),
EMAIL VARCHAR(50),
PHONE varchar(10));

describe TABLE CUSTOMERS;
describe CUSTOMERS;

SELECT * 
from CUSTOMERS;

ALTER TABLE CUSTOMERS
ADD COLUMN ACCOUNTCREATIONDATE DATE;  -- MODYFYING TABLE

DESCRIBE CUSTOMERS;

SELECT * 
from CUSTOMERS; 

CREATE TABLE ACCOUNT(
ACCOUNTID INT,
ACCOUNTTYPE varchar(50),
BALANCE DECIMAL(10,2));

create TABLE TRANSACTIONS(
TRANSACTIONID INT,
TRANSACTIONDATE DATE,
AMOUNT DECIMAL(10,2),
TRANSACTIONTYPE VARCHAR(20));

CREATE TABLE BRANCHES(
BRANCHID INT,
BRANCHNAME varchar(100),
BRANCHADDRESS VARCHAR(255),
BRANCHPHONE varchar(20));

SELECT * 
from transactions;

SELECT * 
from branches;

create table accountbranches(
ASSIGNDATE DATE);

CREATE TABLE LOANS(
LOADID INT,
LOANAMOUNT DECIMAL(10,2),
INTRESTRATE DECIMAL(5,2),
STARTDATE DATE,
ENDDATE DATE);

SHOW tables;

ALTER TABLE CUSTOMERS
DROP COLUMN  ACCOUNTCREATIONDATE; 
SELECT  * 
FROM CUSTOMERS;

ALTER TABLE CUSTOMERS
ADD COLUMN BIRTHDATE DATE;

ALTER TABLE CUSTOMERS
MODIFY PHONE VARCHAR(20),
ADD primary key(CUSTOMERID);

DESCRIBE CUSTOMERS;

DROP TABLE ACCOUNTBRANCHES;

use banking_system;
select *
from account;

alter table account
add customerid int;

alter table account
add constraint
foreign key(customerid)
references customers(customerid);

describe account;

alter table account
add primary key(accountid);

alter table transactions
add constraint
foreign key(accountid)
references account(accountid);

describe account;
describe transactions;

alter table transactions
add primary key(transactionid);

describe transactions;
alter table branches
add primary key(branchid);

alter table account
add branchid int,
add constraint
foreign key(branchid)
references branches(branchid);

alter table loans
add primary key(loadid),
add customerid int,
add constraint
foreign key(customerid)
references customers(customerid);

alter table customers
modify firstname varchar(50) not null,
modify email varchar(50) unique;

describe customers;

-- Adding Records inside the tables

INSERT INTO CUSTOMERS VALUE
(101,'Rahul','Sharma','rahul.sharma@gmail.com','9767983712','1995-04-12');

SELECT * 
FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUE
(102,'Veena','Kutty','veena.kutty@gmail.com','1234567890','1997-09-10'),
(103,'Dominic','Dom','dominic.dom@gmail.com',NULL,'1996-06-03'),
(104,'Alex',NULL,'alex@gmail.com','3232323232','2000-12-12'),
(105,'Alice','George',NULL,'9090909090','2003-08-10');

-- Example to show that Primary Key does not take null values

-- INSERT INTO CUSTOMERS VALUE
-- (NULL,'Rahul','Sharma','rahul.sharma@gmail.com','9767983712','1995-04-12');

INSERT INTO BRANCHES (BRANCHID,BRANCHNAME,BRANCHADDRESS,BRANCHPHONE)
VALUES (1,'Mumbai Main Branch','Andheri East, Mumbai','0220100201'),
(2,'Pune Central Branch','Shivaji Nagar, Pune','0220100202'),
(3,'Bangalore Branch','MG Road, Bangalore','0880100801'),
(4,'Delhi Branch','Connaught Palace,Delhi',NULL),
(5,'Hyderbad Branch',NULL,'0440100401');

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO ACCOUNTS VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',85000.50,102,2),
(1003,'Savings',12500.75,103,1),
(1004,'Salary',45000,104,3),
(1005,'Savings',7800.25,105,2),
(1006,'Savings',42000,101,2),
(1007,'Current',NULL,103,3),
(1008,'Savings',27500,105,4);

INSERT INTO TRANSACTIONS VALUES
(5001,'2026-01-05',10000,'Deposit',1001),
(5002,'2026-01-10',2500,'Withdrawal',1001),
(5003,'2026-01-15',5000,'Transfer',1002),
(5004,'2026-01-20',15000,'Deposit',1003),
(5005,'2026-01-25',3000,'Withdrawal',1004),
(5006,'2026-02-02',7500,'Deposit',1005),
(5007,'2026-02-05',1200,'Payment',1006),
(5008,'2026-02-10',NULL,'Deposit',1007),
(5009,'2026-02-15',8500,'Withdrawal',1008),
(5010,NULL,100,'Payment',1003),
(5011,'2026-02-20',20000,'Transfer',1006),
(5012,'2026-03-01',5000,'Deposit',1002),
(5013,'2026-03-05',10000,'Withdrawal',1007),
(5014,'2026-03-15',1500,'Deposit',1008),
(5015,'2026-03-20',25000,'Transfer',1005);

INSERT INTO LOANS VALUES
(9001,500000,8.50,'2025-01-15','2030-01-15',101),
(9002,250000,9.25,'2025-03-10','2028-03-10',103),
(9003,NULL,9.00,'2026-03-01',NULL,105),
(9004,750000,7.90,'2024-06-20','2031-06-20',102),
(9005,1000000,7.25,'2024-11-15','2034-11-15',104),
(9006,300000,10.50,'2025-07-01','2029-07-01',101);

-- Checking the Data

SELECT * 
FROM CUSTOMERS;

SELECT * 
FROM BRANCHES;

SELECT * 
FROM ACCOUNTS;

SELECT * 
FROM TRANSACTIONS;

SELECT * 
FROM LOANS;

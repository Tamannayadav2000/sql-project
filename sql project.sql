create database emp;

use emp;

create table emp
(EID char(5),
NAME varchar(20),
address varchar(50),
city varchar(20),
DOB date,
phone  char(15),
email varchar(50));

insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0001' , 'tamanna', '130/11 karam vihar ,delhi cantt , sadar bazar' , 'DELHI' , '2000-07-30','701149245', 'tamanna.9819@gmail.com');


insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0006' , 'kuldeep yadav', '130/11 karam vihar ,delhi cantt , sadar bazar' , 'DELHI' , '1899-07-30','7011495745', 'kuldeep.9819@gmail.com');

insert into emp 
values('E0002' , 'noni', '11 vatika , gurgaon' , 'gurgaon' , '2050-11-02','701649245', 'noniyadav@gmail.com'),
('E0003' , 'mukul', '66 vatika , gurgaon' , 'gurgaon' , '2010-07-22','9992224945', 'mukulrao@gmail.com'),
('E0004' , 'anita', '27/1, chitra line, delhi cantt' , 'delhi ' , '1998-11-02','9818275252', 'anitayadav@gmail.com'),
('E0005' , 'rahul', '274/10, bana enclave,dhankar vihar' ,'delhi', '2005-11-03','9818275262', 'rahuldon@gmail.com')
;
 
 
insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0007' , 'suraj choudhary', 'amar colony ,jaipur ' , 'jaipur' , '2000-08-16','7011492907', 'suraj@yahoo.com'),
('E0008' , 'sonu yadav', 'sarojini ,lajpat , sadar bazar' , 'DELHI' , '2010-08-30','7014549245', 'sonu.9819@yahoo.com');

insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0009' , 'nidhi singh', '20/44,kabul line, delhi cantt,sadar bazar ' , 'allahabad' , '2000-08-14','9876492907', 'nsingh@yahoo.com'),
('E0010' , 'rajdeep arora', 'baghanki ,gurgaon , haryana' , 'haryana' , '1956-08-30','7014546789', 'rajarora7@yahoo.com');

insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0011' , 'kishu rai', '77 uttam nagar,janak puri' , 'DELHI' , '2000-01-03','9988776655', 'kishu@yahoo.co.in');

insert into emp(EID , NAME, ADDRESS, CITY, DOB, PHONE, EMAIL) 
values('E0013' ,'malika dang', '24/1 , tilak nagar, mall road, hashington' , 'australia' , '1999-01-09','9989675436', 'malika@yahoo.co.in');


 select * from emp;

 -------------------- creating emp_sal

 create table emp_sal
 (EID char (5),
 dept varchar (15),
 desi varchar(20),
 DOJ date,
 salary int);

 insert into emp_sal values
 ('E0001' , 'ADMIN' , 'MANAGER' , '2015-08-30' , 1000000);

 
 insert into emp_sal values
 ('E0002' , 'HR' , 'associate' , '2000-03-13' , 500000),
  ('E0003' , 'sales' , 'sr. manager' , '1999-07-18' , 200000),
   ('E0004' , 'HR' , 'associate' , '2010-05-13' , 1500000),
    ('E0005' , 'HR' , ' sr . associate' , '2007-03-13' , 300000),
	 ('E0006' , 'ADMIN' , 'MANAGER' , '2001-08-19' , 500000),
	 	 ('E0007' , 'MIS' , 'SR. MANAGER' , '1999-06-08' , 700000);


		 select * from emp_sal;
		
----------------- like operator

select * from emp
where name like '%singh';

---------- increasing manager salary by 10%--------

select * from emp_sal;

update emp_sal
set salary = salary + salary*0.1
where desi = 'manager';

--------------------primary key on eid

alter table emp 
add constraint pkid primary key (EID); 

alter table emp
alter column EID char (5) not null;

---------------------- name not null

alter table emp
alter column name varchar(20) not null;

------------------------- no employ from america

select * from emp;

alter table emp
add constraint ckci check (city != 'america');

alter table emp
add constraint ckcit check  (city in ('delhi' , 'london' , 'gurgaon','jaipur','allahabad', 'haryana', 'kolkata', 'australia'));


-------------no one from pune


 
alter table emp
add constraint ckeckadd check (not address like '%pune%');

---------------- unique phone number

alter table emp
add constraint unph unique (phone);

------------------ email should be gmailcom, yahoo.com, yahoo.co.in only

alter table emp
add constraint checkmail check (email like '%gmail.com%' or email like '%yahoo.com%' or email like '%yahoo.co.in');

  --------------------- age more than >1890

  alter table emp
  add constraint checkdob check ( dob>= '1890-01-08');

  --------------- foreign key on eid

  alter table emp_sal
  add constraint frky foreign key (EID) references emp(eid);

  ----------------------dept should be admin , hr, sales, mis

  select * from emp_sal;

  alter table emp_sal
  add constraint ckdep check (dept in ('admin', 'hr', 'sales' ,'mis')) ; 


---------------------- desi manager, associate, sr manager, sr associate, sr manager
 

alter table emp_sal
add constraint d1 check (DESI in ( 'VP','associate','MANAGER' ));

SELECT DISTINCT DESI FROM EMP_SAL;

------------------------- SALARY > 20000

alter table emp_sal
add constraint chksal check (salary>20000);
 
 select * from emp_sal;
----------------------------- default dept = MIS

alter table emp_sal
add constraint df default 'MIS' FOR dept;

------------------------ city wise employee count

select city , count(eid)
from emp
group by city
order by city desc;

------------------- employee without yahoo account

select * from emp
where email not like '%yahoo.com%' and email not like '%yahoo.co.in%';

-------------------DESI WISE TOTAL COST 

select * from emp_sal;

select desi , count(salary) as 'CS', count(eid) AS'EID'
from emp_sal
group by desi
order by count(eid) DESC ;

--------------------------

SELECT EMP.EID ,NAME, CITY, DOJ, DEPT, DESI, SALARY
FROM EMP
INNER JOIN EMP_SAL
ON EMP.EID=EMP_SAL.EID

-----------------------


SELECT EMP.EID ,NAME, CITY, DOJ, DEPT, DESI, SALARY
FROM EMP
LEFT JOIN EMP_SAL
ON EMP.EID=EMP_SAL.EID


--------------------- assignment 6 ans 1

select * from emp
select * from emp_sal

drop view lvm

select * from lvm;

create view lvm
as
select DOJ, dept, desi , salary as 'basic' , salary *.15 as 'HRA' , salary * .9 as 'PF', salary * .15 + SALARY * .9 + SALARY as 'net' , ( salary * .15 + SALARY * .9 + SALARY) - (SALARY * .9)  AS 'GROSS'
from emp_sal;

---------------------ANSWER 2 

CREATE VIEW LT
AS
SELECT EID ,DESI ,DOJ, DEPT
FROM EMP_SAL
GROUP BY EID,DEPT,DESI,DOJ
HAVING DESI = 'MANAGER' AND DOJ = '2015-08-30';

OR

CREATE VIEW LT1
AS
SELECT EMP.EID ,NAME ,DESI ,DOJ, DEPT
FROM EMP
INNER JOIN EMP_SAL
ON EMP.EID=EMP_SAL.EID
WHERE DESI = 'MANAGER' AND DOJ = '2015-08-30';

SELECT * FROM LT1;


SELECT * FROM LT

--------------------------- ANSWER 3 ( COULDNOT INCLUDE CITY)

SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

CREATE VIEW LO
AS
SELECT DEPT, COUNT(EID) AS 'PERSON COUNT', SUM(SALARY) AS 'SUM SAL', AVG(SALARY) AS 'AVG SAL'
FROM EMP_SAL
GROUP BY DEPT ;

DROP VIEW LO;
SELECT * FROM LO;

--------------ANS 9

SELECT EID , DESI , DEPT, SALARY
FROM EMP_SAL
WHERE SALARY = (SELECT MAX(SALARY) FROM EMP_SAL);

--------------ANS 10

SELECT EID ,NAME , LEN(NAME) 
FROM EMP
WHERE LEN(NAME) = (SELECT MAX(LEN(NAME)) FROM EMP)


--------------------assignment 7 ans 1

select EID, name , city 
from emp
where city = 'gurgaon';

------------------ ans 2

select emp.eid, name , dept, desi, doj, salary 
from emp
inner join emp_sal
on emp.eid = emp_sal.eid
where desi = 'manager'

------------- ans 3 

 update emp_sal
 set salary = salary - 10
 where eid in (select eid from emp where city = 'delhi')

 SELECT * FROM EMP;
SELECT * FROM EMP_SAL;

-------------------------- ans 5

create table training
(EID CHAR(5),
NAME VARCHAR (20),
 DEPT VARCHAR(20));

insert into training(eid, name, dept)
select emp.eid , name , dept
from emp
inner join emp_sal
on emp.eid = emp_sal.eid 
where dept = 'HR';

SELECT * FROM TRAINING;

---------------------ANS 6

DELETE FROM TRAINING
WHERE EID IN (SELECT eid from training where dept = 'HR');

---------------ANS 7

SELECT * FROM EMP_SAL

SELECT * FROM EMP
WHERE EID IN (SELECT EID FROM EMP_SAL WHERE SALARY > '700000')

-------------------- INVENTRY TABLE

create table supplier
(Sid char(5),
SNAME VARCHAR(25) NOT NULL,
SADD VARCHAR (20) NOT NULL,
SCITY VARCHAR(25) DEFAULT 'DELHI',
SPHONE CHAR(20) UNIQUE,
EMAIL VARCHAR(40)
PRIMARY KEY(SID));

alter table supplier
alter column sadd varchar(50);

CREATE TABLE PRODUCT
(PID CHAR(5),
PDESC VARCHAR(25) NOT NULL,
price int check ( PRICE > 0),
category varchar(20) check (CATEGORY in ('IT' , 'HA' , 'HC')),
SID CHAR(5) REFERENCES SUPPLIER (SID),
PRIMARY KEY (PID))


CREATE TABLE STOCK
(PID CHAR (5) REFERENCES PRODUCT (PID),
SQTY INT CHECK (SQTY >=0),
ROL INT CHECK (ROL >0),
MOQ INT CHECK (MOQ >=5))

CREATE TABLE CUST
(CID CHAR(5),
CNAME VARCHAR(30) NOT NULL,
address varchar(50) not null,
city varchar(20) not null,
phone char(20) not null,
email varchar(30) not null,
DOB DATE CHECK (DOB <= '2000-01-01'),
PRIMARY KEY (CID));


CREATE TABLE ORDERS
(OID CHAR(5),
ODATE DATE,
PID CHAR(5) REFERENCES PRODUCT (PID),
CID CHAR (5) REFERENCES CUST (CID),
OQTY INT CHECK (OQTY >= 1),
PRIMARY KEY (OID));

----------------------------------
select * from supplier

create procedure addsupplier (@Sid char(5),@SNAME VARCHAR(25),@SADD VARCHAR (50),@SCITY VARCHAR(25),@SPHONE CHAR(20),@EMAIL VARCHAR(40))
as 
begin

insert into supplier 
values(@sid, @sname, @sadd, @scity, @sphone, @email)

select * from supplier 
where sid = @sid

end;


addsupplier 'S0001' , 'TAMANNA RAO', '27/1 KABUL LINE RAMPUR' , 'PUNE' , '9877775252' , 'TAMYADAV.9818@gmail.com'
addsupplier 'S0003', 'NONIN CHAUDHARY', '130 KAROL BAGH MALL ROAD BANGALORE' , 'BANGALORE' , '9999275252' , 'NONINC.9876@YAHOO.com',
ADDSUPPLIER 'S0004' , 'NIDHI SINGH', 'SEC 5 GURGAON ANSAL PLAZA' , 'GURUGRAM' , '9865768798' , 'NSINGH.98@YAHOO.com'
ADDSUPPLIER 'S0006' , 'ANITA THAKUR', 'VPO BAGHANKI TEHSIL GURGAON' , 'HARYANA' , '8876152435' , 'ANITHA.@YAHOO.com'
ADDSUPPLIER 'S0007' , 'KAPIL DEV', 'BAGA BEACH GOA' , 'GOA' , '2345678900' , 'KDEV.IO@gmail.com'
ADDSUPPLIER 'S0008' , 'VICKEY KAUSHAL', '12 SEC MUMBAI ' , 'MUMBAI' , '9818345678' , 'VKAUSHAL.9@gmail.com'

-----------------------
-------------
SELECT * FROM PRODUCT



ADDPRODUCT 'P0002', 'DELL KEYBOARD' , '20000' ,'IT' , 'S0002'),
('P0003', 'DELL MOUSE' , '15000' ,'IT' , 'S0003'),
('P0004', 'HP LAPTOP' , '20000' ,'HA' , 'S0004'),
('P0005', 'LENOVO COMPUTER' , '35000' ,'HC' , 'S0005'),
('P0006', 'HP CPU' , '5000' ,'HC' , 'S0006'),
('P0007', 'APPLE MACBOOK' , '50000' ,'HA' , 'S0007'),
('P0008', 'APPLE PHONE' , '64000' ,'IT' , 'S0008'),
('P0009', 'TOSHIBA CHARGER' , '9000' ,'IT' , 'S0009'),
('P0010', 'DELL LAPTOP' , '45000' ,'HC' , 'S0010'),
('P0011', 'HP KEYBOARD' , '15000' ,'HA' , 'S0011'),
('P0012', 'TOSHIBA CPMPUTER' , '11000' ,'HA' , 'S0012')


INSERT INTO STOCK VALUES
('P0002', 9,6,6),
('P0003', 6,7,6),
('P0004', 3,9,8),
('P0005', 8,7,6),
('P0006', 3,9,9)


INSERT INTO CUST VALUES
('C0001' , 'tamanna yadav',	'130/11 karam vihar ,delhi cantt , sadar bazar','	DELHI','701149245' , 'tamanna.9819@gmail.com', '1999-11-30'),
('C0002',	'noni bharadwaaj'	,'11 vatika , gurgaoN' , ' HARYANA' , ' 9818277777' , 'NONBHAR@YAHOO.COM' , '1998-9-23'), 
('C0003',	'anita'	,'27/1, chitra line, delhi cantt'	,'KERALA', 	'9818275252'     	,'anitayadav@gmail.com','1998-11-02'),
('C0004',	'rahul'	,'274/10, bana enclave,dhankar vihar',	'delhi',	'9818275262'     	,'rahuldon@gmail.com' ,'1995-11-03	'),
('C0005',	'kuldeep yadav'	,'130/11 karam vihar ,delhi cantt , sadar bazar'	,' DELHI'	,'7011495745' 	,'kuldeep.9819@gmail.com','1899-07-30'),
('C0006',	'ANJILI yadav'	,'SSEC 5 ANSAL PLAZA , DELHI' , 'PUNE'	,'7011495745' 	,'kuldeep.9819@gmail.com','1899-07-30')


INSERT INTO CUST VALUES
('C0007' , 'tamann',	'130/11 karam vihar ,delhi cantt , sadar bazar','	DELHI','701149245' , 'tamanna.9819@gmail.com', '1999-11-30'),
('C0008',	'noni bharadwaaj'	,'11 vatika , gurgaoN' , ' HARYANA' , ' 9818277777' , 'NONBHAR@YAHOO.COM' , '1999-7-22') 


INSERT INTO ORDERS VALUES
('O0002', '2005-05-23' , 'P0002' , 'C0002' , 5),
('O0003', '2002-08-03' , 'P0003' , 'C0003' , 4),
('O0004', '2000-11-13' , 'P0004' , 'C0004' , 6),
('O0005', '2019-03-29' , 'P0005' , 'C0005' , 7),
('O0006', '2015-05-23' , 'P0006' , 'C0006' , 8)

------------------------------
------------------------
--------------

SELECT * FROM CUST
SELECT * FROM ORDERS
SELECT * FROM STOCK
SELECT * FROM SUPPLIER
SELECT * FROM PRODUCT

SELECT * FROM PRODUCT
SELECT * FROM SUPPLIER

SELECT A.SID , SNAME, SCITY, PID , PDESC, CATEGORY
FROM PRODUCT 
INNER JOIN SUPPLIER A
ON A.SID = PRODUCT.SID

---------------------------- JOINING  3 TABLES

SELECT * FROM CUST
SELECT * FROM ORDERS
SELECT * FROM PRODUCT

SELECT A.CID, CNAME, CITY, OID, ODATE , OQTY , B.PID , PDESC, PRICE ,CATEGORY , PRICE*OQTY AS TOT_QTY
FROM CUST A
INNER JOIN ORDERS B
ON A.CID = B.CID
INNER JOIN PRODUCT
ON B.PID = PRODUCT.PID 

----------------
-------- VIEW BILL

CREATE VIEW BILL
AS
SELECT A.CID ,A.PID, OID , ODATE, OQTY , CNAME , ADDRESS, PHONE  , PDESC, PRICE ,PRICE*OQTY AS TOT_RATE
FROM ORDERS A
INNER JOIN CUST 
ON A.CID = CUST.CID
INNER JOIN PRODUCT 
ON PRODUCT.PID = A.PID

SELECT * FROM BILL

-------------------------------
------------------------
-------------------


SELECT * FROM CUST
SELECT * FROM ORDERS
SELECT * FROM STOCK
SELECT * FROM SUPPLIER
SELECT * FROM PRODUCT;

-- INSERT TRIGGER 

CREATE TRIGGER LK
ON ORDERS
FOR INSERT
AS
BEGIN
    UPDATE STOCK SET SQTY = SQTY -(SELECT OQTY FROM INSERTED)
	 WHERE PID = (SELECT PID FROM INSERTED)
	 END;
	 
INSERT INTO ORDERS VALUES ('O0008',	'2015-05-23'	,'P0001'	,'C0006',	1)

-- DELETE TRIGGER

SELECT * FROM PRODUCT
SELECT * FROM STOCK
DROP TRIGGER DEL

CREATE TRIGGER DEL
ON PRODUCT
FOR DELETE
AS
BEGIN
 DELETE FROM STOCK
 WHERE PID = (SELECT PID FROM deleted);
 END;

 DELETE FROM PRODUCT WHERE PID = 'POOO6'



CREATE DATABASE CRUMBL_COOKIE
GO

USE CRUMBL_COOKIE
----------------------------STORES---------------------------------------------
--Create Table DOWN--
DROP TABLE IF EXISTS Stores

--Create Table UP Stores--
CREATE TABLE Stores
(
STORE_ID INT NOT NULL,
ADDRESS VARCHAR (100) NOT NULL,
CITY VARCHAR(50) NOT NULL,
STATE VARCHAR(2) NOT NULL,
ZIP_CODE VARCHAR(5) NOT NULL,
PHONE_NUMBER VARCHAR(10) NOT NULL,
CONSTRAINT pk_Stores_STORE_ID Primary Key (Store_ID),
CONSTRAINT u_PHONE_NUMBER unique (PHONE_NUMBER)
)


--Create Table UP Stores--
INSERT INTO Stores 
(STORE_ID, ADDRESS, CITY, STATE, ZIP_CODE, PHONE_NUMBER)
VALUES
('201','1595 Niagara Falls, Bvld Suite 600','Amherst','NY',14228,3152187797),
('202','3405 Erie Bvld. E','Dewitt','NY',13214,3152349923),
('203','100 Marketplace Dr, Suite 120','Henrietta','NY',14623,3152429500),
('204','1195 3rd Ave','New York','NY',10021,2122009027),
('205','256A Daniel Webster Hwy','Nashua','NH',03045,6032044761),
('206','2 Cellu Dr, unit 101','North Nashua','NH',03003,6032339643),
('207','45 Gosling Rd STE 5c','Newington','NH',04534,6032810947),
('208','55 Central Street Unit D','Salem','NH',04545,6032127033)

------------------------------Payroll---------------------------------------------------------------------------------------------------
---Create Table DOWN Payroll----
DROP TABLE IF EXISTS Payroll

---Create Table UP Payroll----
CREATE TABLE Payroll
(
PAYROLL_ID INT not null,
Position VARCHAR(100) NOT NULL,
Hourly_Wage MONEY NOT NULL,
OT_Wage MONEY NOT NULL,
constraint pk_Payroll_PAYROLL_ID primary key (PAYROLL_ID)
)

--Create Table UP Payroll--
INSERT INTO Payroll
(PAYROLL_ID,Position, Hourly_Wage, OT_Wage) 
VALUES
(5001,'Manager',15.5,23.25),
(5002,'Crew Member',2,3),
(5003,'Janitorial',3,4.5),
(5004,'Delivery',4,6)


-------------------------------Department------------------------------------------------------------------------------------------------
---Create Table DOWN Department----
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Payroll_PAYROLL_ID')
Alter table Department drop constraint fk_Payroll_PAYROLL_ID
DROP TABLE IF EXISTS Department

---Create Table UP Department----
CREATE TABLE Department
(
DEPARTMENT_ID INT identity not null,
PAYROLL_ID INT not NULL,
Department VARCHAR(100) NOT NULL,
Hours_Required VARCHAR(100) NOT NULL,
OT_Eligible VARCHAR(1) NOT NULL,
Benefit_Eligible VARCHAR(1) NOT NULL,
constraint pk_Department_DEPARTMENT_ID primary key (DEPARTMENT_ID)
)
ALTER TABLE Department ADD CONSTRAINT fk_Payroll_PAYROLL_ID FOREIGN KEY (PAYROLL_ID) REFERENCES Payroll(PAYROLL_ID)

----Create Table UP DEPARTMENT----
INSERT INTO Department
(Department, PAYROLL_ID, Hours_Required, OT_Eligible, Benefit_Eligible)
VALUES
('Management',5001,50,'N','Y'),
('Crew Member',5002,30,'Y','Y'),
('Janitorial',5003,15,'Y','Y'),
('Delivery',5004,20,'Y','Y')

------------------------------EMPLOYEES---------------------------------------------------------------------------------------------------
---Create Table DOWN EMPLOYEES----
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME=' fk_Stores_STORE_ID')
 Alter table department drop constraint fk__Stores_STORE_ID
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Department_DEPARTMENT_ID')
 Alter table department drop constraint fk_Department_DEPARTMENT_ID
DROP TABLE IF EXISTS Employees

---Create Table UP EMPLOYEES----
CREATE TABLE  Employees
(
EMPLOYEE_ID int NOT NULL,
STORE_ID int NOT NULL,
DEPARTMENT_ID int NOT NULL,
FIRST_NAME VARCHAR(100) NOT NULL,
LAST_NAME VARCHAR(100) NOT NULL,
CONSTRAINT PK_Employees_EMPLOYEE_ID Primary Key (EMPLOYEE_ID)
)

ALTER TABLE Employees ADD CONSTRAINT fk_Stores_STORE_ID Foreign Key (STORE_ID) References Stores(STORE_ID)
ALTER TABLE Employees ADD CONSTRAINT fk_Department_DEPARTMENT_ID Foreign Key (DEPARTMENT_ID) References Department(DEPARTMENT_ID)

----Create Table UP Employees----
INSERT INTO Employees
(EMPLOYEE_ID, STORE_ID, DEPARTMENT_ID, FIRST_NAME, LAST_NAME)
VALUES
(10001,201,1,'Joe','Shmoe'),
(10002,203,3,'Cameron','Skipworth'),
(10003,201,2,'Paul','Boyd'),
(10004,204,3,'Justin','Hall'),
(10005,203,3,'Collin','Taylor'),
(10006,201,1,'Bum','Skipworth'),
(10007,204,2,'Tom','Taylor'),
(10008,203,1,'Melaine','Taylor'),
(10009,201,2,'Zeus','Taylor'),
(10010,207,1,'Kishan','Rathor'),
(10011,206,3,'Liver','King'),
(10012,208,4,'Reese','Toby'),
(10013,205,2,'Stacy','Donnie'),
(10014,203,3,'Alexa','Dana'),
(10015,202,1,'Hat','Birdy')

--------------------------------PRODUCT-------------------------------------------------------------------------------------------------
---Create Table DOWN PRODUCT----
DROP TABLE IF EXISTS Product

---Create Table UP PRODUCT----
CREATE TABLE  Product
(
PRODUCT_ID int identity NOT NULL,
Cookie_Type VARCHAR(50) NOT NULL,
Temp VARCHAR(10) NOT NULL,
Size VARCHAR(10) NOT NULL,
Filled_or_Frosted VARCHAR(10) NULL,
CONSTRAINT PK_Product_PRODUCT_ID Primary Key (PRODUCT_ID)
)

----Create Table UP Product----
INSERT INTO Product
(Cookie_Type,Temp,Size,Filled_or_Frosted)
VALUES
('Sugar','Chilled','Regular',Null),
('Snickerdoodle','Warm','Regular',Null),
('Chocolate Chip','Warm','Mini',Null),
('Sea Salt Toffee','Warm','Regular','Frosted'),
('Peanut Butter Brittle','Warm','Mini','Frosted'),
('Molten Lava','Warm','Regular','Filled'),
('Pecan Pie','Warm','Regular','Filled'),
('Pink Sugar Cookie','Chilled','Mini','Frosted')

--------------------------------Inventory-------------------------------------------------------------------------------------------------
---Create Table DOWN Inventory----
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Product_PRODUCT_ID')
ALTER TABLE Inventory drop constraint fk_Product_PRODUCT_ID
DROP TABLE IF EXISTS Inventory

---Create Table UP Inventory----
CREATE TABLE  Inventory
(
INVENTORY_ID int NOT NULL,
PRODUCT_ID int NOT NULL,
Inventory_Count int NOT NULL,
Status VARCHAR(1) NOT NULL,
CONSTRAINT PK_Inventory_INVENTORY_ID Primary Key (INVENTORY_ID)
)

ALTER TABLE Inventory ADD CONSTRAINT fk_Product_PRODUCT_ID Foreign Key (PRODUCT_ID) References Product(PRODUCT_ID)

----Create Table UP Inventory----
INSERT INTO Inventory
(INVENTORY_ID, PRODUCT_ID, Inventory_Count,Status)
VALUES
(101,1,256,'Y'),
(102,2,343,'Y'),
(103,3,132,'Y'),
(104,4,123,'Y'),
(105,5,0,'N'),
(106,6,45,'Y'),
(107,7,65,'Y'),
(108,8,87,'Y')


--------------------------------Inventory_Invoices-------------------------------------------------------------------------------------------------
---Create Table DOWN Inventory_Invoices----
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Inventory_INVENTORY_ID')
ALTER TABLE Inventory_Invoices drop constraint fk_Inventory_INVENTORY_ID
DROP TABLE IF EXISTS Inventory_Invoices

---Create Table UP Inventory_Invoices----
CREATE TABLE  Inventory_Invoices
(
INVOICE_ID int NOT NULL,
INVENTORY_ID int NOT NULL,
Purchase_Amount MONEY NOT NULL,
Units_Sold int NOT NULL,
Unit_Cost MONEY NOT NULL,
Invoice_Date DATE NOT NULL
CONSTRAINT PK_Inventory_Invoices_INVOICE_ID Primary Key (INVOICE_ID)
)

ALTER TABLE Inventory_Invoices ADD CONSTRAINT fk_Inventory_Inventory_ID Foreign Key (INVENTORY_ID) References Inventory(INVENTORY_ID)

----Create Table UP Inventory_Invoices----
INSERT INTO Inventory_Invoices
(INVOICE_ID, INVENTORY_ID, Purchase_Amount, Units_Sold, Unit_Cost, Invoice_Date)
VALUES
(30001,101,32.03,2,64.06,'12/2/22'),
(30002,102,23,123,2829,'12/01/22'),
(30003,103,20.12,70,1408.4,'11/12/22'),
(30004,104,30.12,103,3102.36,'11/03/22'),
(30005,105,33.33,65,2166.45,'12/09/22'),
(30006,106,48.32,54,2609.28,'12/10/22'),
(30007,107,37.38,2,74.76,'07/12/22'),
(30008,108,37.32,252,9404.64,'07/12/22'),
(30009,101,94.32,25,2358,'08/12/22'),
(30010,102,32.32,25,808,'08/12/22'),
(30011,103,21.54,13,280.02,'08/23/22'),
(30012,104,87.65,73,6398.45,'09/29/22'),
(30013,105,65.35,6,392.1,'09/29/22'),
(30014,106,53.65,5,268.25,'10/31/22'),
(30015,107,54.9,4,219.6,'10/31/22')

--------------------------------Customers-------------------------------------------------------------------------------------------------
---Create Table DOWN Customers----
DROP TABLE IF EXISTS Customers

---Create Table UP Customers----
CREATE TABLE  Customers
(
CUSTOMER_ID int NOT NULL,
First_Name VARCHAR(100) NOT NULL,
Last_Name VARCHAR(100) NOT NULL,
Address VARCHAR(150) NOT NULL,
City VARCHAR(100) NOT NULL,
State VARCHAR(10) NOT NULL,
Zip_Code VARCHAR(5) NOT NULL,
Phone_Number VARCHAR(10)
CONSTRAINT PK_Customers_CUSTOMER_ID Primary Key (CUSTOMER_ID)
)

----Create Table UP Customers----
INSERT INTO Customers
(CUSTOMER_ID,First_Name,Last_Name,Address,City,State,Zip_Code, Phone_Number)
VALUES
(20001,'Silvestra','Carmine','202 happy lane','Amherst','NY',14228,3152182933),
(20002,'Clemency', 'Lake','303 washington st','Dewitt','NY',14228,3152349474),
(20003,'Eli','Corynn','3930 forest drive','Henrietta','NY',14623,3152421039),
(20004,'Tuck','Androll','393 lincoln ave','New York','NY',10021,2122003950),
(20005,'Collin','Skipworth','234 fedex drive','Nashua','NH',03045,6032042842),
(20006,'Bum','Taylor','344 mcdonald drive','North Nashua','NH',03003,6032330549),
(20007,'Rush','Henrietta','23 long shadow dr','Newington','NH',04534,6032813857),
(20008,'Emmanuel','Rayner','202 Top Ave','Salem','NH',04545,6032125754),
(20009,'Zeus','Gage','102 MLK Bvld.','Nashua','NH',03045,6032045865),
(20010,'Brent','Sebastian','102 Sebastian St.','Nashua','NH',03045,6032049867),
(20011,'King','Liver','3292 Poseidon Circle','Dewitt','NY',14228,3152349755),
(20012,'Toby','Gazandlare','344 Oak Brook Rd','Amherst','NY',14228,3152189373),
(20013,'Stacy','Donnie','193 Trail Ave','Henrietta','NY',14623,3152422342),
(20014,'Beckah','Dana','300 Cherokee Ln','Henrietta','NY',14623,3152426845),
(20015,'Bird','Hat','324 Snake Drive','New York','NY',10021,2122005346)


--------------------------------Credit_Cards-------------------------------------------------------------------------------------------------
---Create Table DOWN Credit_Cards----
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Customers_CUSTOMER_ID')
ALTER TABLE Credit_Cards drop constraint fk_Customers_CUSTOMER_ID
DROP TABLE IF EXISTS Credit_Cards

---Create Table UP Credit Cards----
CREATE TABLE  Credit_Cards
(
CREDIT_CARD_ID bigint NOT NULL,
Customer_ID int NOT NULL,
Brand VARCHAR(100) NOT NULL,
Exp_month VARCHAR(10) NOT NULL,
Exp_year int NOT NULL,
CVV int NOT NULL,
CONSTRAINT PK_Credit_Cards_CREDIT_CARD_ID Primary Key (CREDIT_CARD_ID)
)

ALTER TABLE Credit_Cards ADD CONSTRAINT fk_Customers_CUSTOMER_ID Foreign Key (Customer_ID) References Customers(Customer_ID)

----Create Table UP Credit Cards----
INSERT INTO Credit_Cards
(CREDIT_CARD_ID,Customer_ID,Brand,Exp_month,Exp_year,CVV)
VALUES
(3462205931192132,20001,'AMEX',12,2034,234),
(3482852291980402,20002,'Mastercard',09,2042,654),
(5168983913621003,20003,'Visa',07,2034,654),
(4671988838998942,20004,'Visa',04,2029,876),
(4301532250995750,20005,'Visa',06,2029,678),
(4740786751346447,20006,'Amex',06,2027,856),
(4872211875965691,20007,'Mastercard',03,2027,564),
(3459857973057998,20008,'Amex',11,2045,454),
(5159221491117040,20009,'Mastercard',03,2030,425),
(5163190751587610,20010,'Amex',01,2027,256),
(5169041634751762,20011,'Mastercard',06,2026,642),
(3471620098186686,20012,'Amex',04,2025,724),
(5121289236714285,20013,'Amex',01,202,645),
(5185335609417015,20014,'Amex',06,2045,256),
(3537373602849374,20015,'MasterCard',03,2036,238)

--------------------------------Cookie_Sales-------------------------------------------------------------------------------------------------
---Create Table DOWN Sales----
Begin
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Cookie_Sales_STORE_ID'
	AND TABLE_NAME = 'Cookie_Sales')
 Alter table CRUMBL_COOKIE.dbo.Cookie_Sales drop constraint fk_Cookie_Sales_STORE_ID
 END
Begin
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Cookie_Sales_INVENTORY_ID'
	AND TABLE_NAME = 'Cookie_Sales')
 Alter table Cookie_Sales drop constraint fk_Cookie_Sales_INVENTORY_ID
 END
BEGIN
IF exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Cookie_Sales_CREDIT_CARD_ID'
	AND TABLE_NAME = 'Cookie_Sales')
 Alter table Cookie_Sales drop constraint fk_Cookie_Sales_CREDIT_CARD_ID
 END
DROP TABLE IF EXISTS Cookie_Sales

---Create Table UP Sales----
CREATE TABLE Cookie_Sales
(
Sale_ID int NOT NULL,
STORE_ID int NOT NULL,
INVENTORY_ID int NOT NULL,
CREDIT_CARD_ID bigint NOT NULL,
Sale_date date NOT NULL,
Transaction_amount varchar (10) not null,
Cookie_sale_count int not null,
Method_of_payment varchar(20),
CONSTRAINT PK_Sales_SALE_ID Primary Key (SALE_ID)
)

ALTER TABLE Cookie_Sales ADD CONSTRAINT fk_Cookie_Sales_STORE_ID Foreign Key (STORE_ID) References Stores(STORE_ID)
ALTER TABLE Cookie_Sales ADD CONSTRAINT fk_Cookie_Sales_INVENTORY_ID Foreign Key (INVENTORY_ID) References Inventory(INVENTORY_ID)
ALTER TABLE Cookie_Sales ADD CONSTRAINT fk_Cookie_Sales_CREDIT_CARD_ID Foreign Key (CREDIT_CARD_ID) References Credit_Cards(CREDIT_CARD_ID)

----Create Table UP Sales----
INSERT INTO Cookie_Sales
(Sale_ID,Store_ID,Inventory_ID,CREDIT_CARD_ID,Sale_date,Transaction_amount,Cookie_sale_count,Method_of_payment)
VALUES
(1001,203,101,3462205931192132,'12/05/2022',$4.97 ,1,'Credit Card'),
(1002,204,103,3482852291980402,'12/05/2022',$8.93 ,2,'Credit Card'),
(1003,203,108,5168983913621003,'12/06/2022',$14.93 ,5,'Credit Card'),
(1004,208,108,4671988838998942,'12/06/2022',$22.30 ,3,'Credit Card'),
(1005,207,103,4301532250995750,'12/07/2022',$77.98 ,6,'Credit Card'),
(1006,201,101,4740786751346447,'12/07/2022',$101.13 ,1,'Credit Card'),
(1007,203,104,4740786751346447,'12/08/2022',$57.56 ,4,'Credit Card'),
(1008,204,106,4872211875965691,'12/08/2022',$32.65 ,5,'Credit Card'),
(1009,205,104,3459857973057998,'12/09/2022',$54.10 ,7,'Credit Card'),
(1010,207,102,5159221491117040,'12/10/2022',$21.12 ,7,'Credit Card'),
(1011,203,104,5163190751587610,'12/22/2022',$23.44 ,7,'Credit Card'),
(1012,204,104,5169041634751762,'12/02/2022',$23.44 ,7,'Credit Card'),
(1013,203,104,3471620098186686,'11/28/2022',$12.43 ,2,'Credit Card'),
(1014,206,104,5121289236714285,'11/29/2022',$80.54 ,8,'Credit Card'),
(1015,205,103,5185335609417015,'12/03/2022',$43.56 ,5,'Credit Card'),
(1016,204,105,3537373602849374,'12/04/2022',$64.54 ,8,'Credit Card')


-------------------------------------------CREATE VIEW----------------------------------------------------------------------------------------

CREATE VIEW dbo.employee_overview as
select e.FIRST_NAME, e.last_name, d.*, p.Position, p.Hourly_Wage
from Employees e
join department d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID
join payroll p
on p.PAYROLL_ID=d.PAYROLL_ID;


---------------------------------------------Stored Procedure----------------------------------------------------------------------------------------

CREATE PROCEDURE new_cookie_product as
insert into Product
(Cookie_Type, Temp, Size, Filled_or_Frosted)
VALUES
('Lemon Crinkle', 'Chilled', 'Mini', 'Frosted'),
('Candy Cane', 'Chilled', 'Mini', 'Frosted')

EXEC new_cookie_product

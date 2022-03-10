create database store;

use store;

create table Products (
	ProductID int primary key,
    ProductName varchar(40) not null,
    SupplierID int,
    CategoryID int,
    QuantityPerUnit varchar(20),
    UnitPrice int,
    UnitsInStock int,
    UnitsOnOrder int,
    RecorderLevel int,
    Discontinued int
    );
    
create table Suppliers (
	SupplierID int primary key,
    CompanyName varchar(40) not null,
    ContactName varchar(30),
    ContactTitle varchar(30),
    Address varchar(60), 
    City varchar(15),
    Region varchar(15),
    REtion varchar(15),
    PostalCode varchar(10),
    Country varchar(15),
    Phone varchar(24),
    Fax varchar(24),
    HomePage varchar(24)
);

create table Region (
	RegionID int primary key,
    RegionDescription varchar(50)
);
    
create table Orders (
	OrderID int primary key,
    CustomerID int,
    EmployeeID int,
    OrderDate datetime,
    ReuiredDate datetime,
    ShpipedDate datetime,
    ShipVia int,
    Freight int,
    ShipName varchar(40),
    ShipAddress varchar(40),
    ShipCity varchar(15),
    ShipRegion varchar(15),
    ShiptPostalCode varchar(10),
    ShipCountry varchar(15)
);

create table Order_Details (
	OrderID int,
    ProductID int,
    UnitPrice float,
    Quantity int,
    Discount int,
    primary key(OrderID, ProductID)
);

create table Categories (
	 categoryID int primary key,
     CategoryName varchar(15),
     Description varchar(50)
);

create table Employees (
	 EmployeeID int primary key,
     LastName varchar(20) not null,
     FirstName varchar(20) not null,
     Title varchar(30),
     TitleOfCourtesy varchar(25),
     BirthDate datetime,
     HireDate datetime,
     Address varchar(50),
     City varchar(15),
     Region varchar(15),
     PostalCode varchar(10),
     Country varchar(15),
     HomePhone varchar(24),
     Extension varchar(40),
	 Notes varchar(50),
     ReportsTo int,
     PhotoPath varchar(255)
);

drop table EmployeeTerritories;

create table EmployeeTerritories (
	EmployeeID int,
    TerritoryID int
);

create table Customers (
	CustomerID int primary key,
    CompanyName varchar(40),
    ContactName varchar(30),
    ContactTitle varchar(30),
    Address varchar(50),
    City varchar(15),
    Region varchar(15),
    PostalCode varchar(10),
    Country varchar(15),
    Phone varchar(24),
    Fax varchar(24)
);

create table CustomerDemo (
	CustomerID int,
    CustomerTypeID int,
    primary key(CustomerID, CustomerTypeID)
);

create table CustomerDemographics (
	CustomerTypeID int primary key,
    CustomerDesc varchar(40)
);

create table Shippers (
	ShipperID int primary key,
    CompanyName varchar(40),
    Phone varchar(24)
);

alter  table Order_Details
add constraint fk_product foreign key (ProductID) references Products(ProductID);

alter table Products
add constraint fk_category foreign key (CategoryID) references Categories(CategoryID);

alter table Products
add constraint fk_supplier foreign key (SupplierID) references Suppliers(SupplierID);

alter table Orders
add constraint fk_employee foreign key (EmployeeID) references Employees(EmployeeID);

alter table Orders
add constraint fk_customer foreign key (CustomerID) references Customers(CustomerID);

alter table Orders
add column ShipperID int;

alter table Orders
add constraint fk_shipper foreign key (ShipperID) references Shippers(ShipperID);

alter table EmployeeTerritories
add constraint fk_employeee foreign key (EmployeeID) references Employees(EmployeeID);
	
alter table EmployeeTerritories
add constraint fk_terterritoriesy foreign key (TerritoryID) references Territories(TerritoryID);

alter table CustomerDemo
add constraint fk_custo foreign key(CustomerID) references Customers(CustomerID);

alter table CustomerDemo
add constraint fk_custodemo foreign key(CustomerTypeID) references CustomerDemographics(CustomerTypeID);

alter table Territories
add constraint fk_region foreign key(RegionID) references Region(RegionID);
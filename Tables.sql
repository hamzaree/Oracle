create table Employee(
empno VARCHAR2(8) not null,
empname varchar2(40) not null,
department varchar2(40) not null,
email VARCHAR2(40)not null,
phone VARCHAR2(40)not null,
constraint Employeepk primary key (empno)
);

create table Facility(
facno varCHAR2(8) not null,
facname VARCHAR2(40) not null,
CONSTRAINT Facilitypk PRIMARY KEY (facno)
);

create table Location(
facno varCHAR2(8) not null ,
locno varCHAR2(8) not null ,
locname VARCHAR2(50) not null,
CONSTRAINT Locationpk PRIMARY KEY (locno),
constraint Facilityfk FOREIGN key (facno) REFERENCES facility
);

create table Customer (
custno VARCHAR2(8) not null,
custname VARCHAR2(40) not null,
address VARCHAR2(40) not null,
internal CHAR(1) not null,
contact VARCHAR2(40) not null,
phone CHAR(7) not null,
city VARCHAR2(40) not null,
state VARCHAR2(50) not null,
zip NUMBER(5) not null,
CONSTRAINT Customerpk PRIMARY KEY (custno) 
);

Create table ResourceTbl (
resno VARCHAR2(8) not null,
resname VARCHAR2(40) not null,
rate VARCHAR2(40) not null,
constraint ResourceTblpk primary key (resno)
);



create table EventRequest(
eventno varchar2(8) not null,
dateheld date not null,
datereq date not null,
custno varchar2(8) not null,
facno varchar2(8) not null,
dateauth date,
status char(8) not null,
estcost varchar2(20) not null,
estaudience number(10) not null,
budno varchar2(8),
constraint Eventequestpk primary key (eventno),
constraint Facilityfk2 foreign key (facno) references Facility,
constraint Customerfk foreign key (custno) references Customer

);

create table EventPlan(
planno varchar2(8) not null,
eventno varchar2(8) not null,
workdate date not null,
notes varchar2(40),
activity varchar2(40) not null,
empno varchar2(8) ,
constraint EventPlanpk primary key (planno),
constraint EventRequestfk foreign key (eventno) references EventRequest,
constraint Employeefk foreign key (empno) references Employee
);

create table EventPlanLine (
planno varchar2(8) not null,
lineno varchar2(8) not null,
timestart date not null,
timeend date not null,
numberfld varchar2(20) not null,
locno varchar2(8) not null,
resno varchar2(8) not null,
constraint EventPlanLinepk primary key (planno,lineno),
constraint Locationfk foreign key (locno) references Location,
constraint ResourceTblfk foreign key (resno) references ResourceTbl,
constraint EventPLanfk foreign key (planno) references EventPlan
); 

CREATE database surya;
use surya;
create table Dept(
DeptNO int primary key,
Dname varchar(255),
LOC varchar(255)
);

alter table Dept rename as Department;
alter table Department ADD Pincode varchar(10) not null;
alter table Department rename column DName to DeptAdd;
alter table Department MODIFY LOC char (20);
select * from Department;

drop table Department;


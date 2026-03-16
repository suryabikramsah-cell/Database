drop database  BankDB; 
create database BankDB;
use BankDB;
create table accounts(
account_id int primary key,
account_holder varchar(50),
balance decimal(10,2)
);
insert into accounts values 
(1, 'Ram' , 50000),
(2, 'shyam' , 30000),
(3, 'sita', 20000);


#write a transaction that transfer Rs. 5000 from Ram's account to Shyam's account.

start transaction;

update accounts
set balance = balance - 5000
where accoount_id = 1;
update accounts
set balance = balance +5000
where accoount_id = 2;
commit;
select *from accounts;

#write a transaction that trandfer rs. 10000 from shyam's account to sita's acoount and demostrate the use of rollback

start transaction;

update accounts
set balance = balance - 10000
where accoount_id = 2;
update accounts
set balance = balance +10000
where accoount_id = 3;
rollback;
select *from accounts;

# savepointPOINT while updating account balances.

start transaction;
update accounts
set balance = balance +2000
where accounts_id = 2;
rollback to sp1;
commit;
 
 #Triggers 
 #1 Create a table employees
 #with the fields: emp_id, name, salary.
 
 create table employee (
 emp_id int primary key,
 name varchar(100),
 salary decimal (10,2));
 
 #2 create another table salary_log  to record employee salary changes with field; log_id, emp_id,
 #old_salary, new_salary, update_at.
 
 create table salary_log(
 log_id int auto_increment primary key,
 emp_id int,
 old_salary decimal(10,2),
 new_salary decimal(10,2),
 updated_at timestamp default current_timestamp
 );
 
 
 
#create a before insert trigger on employee that prevent inserting employee whose salary is less than 10000.

Delimiter $$
create trigger check_salary
before insert on employee 
for each row 
begin 
if new.salary <10000 then 
signal sqlstate '45000'
set message_text = "salary must be atleast 10000";
end if ;
end $$



Delimiter ;

# after update trigger
Delimiter $$
create trigger log_salary_update
after update on employees
for each row
begin 
insert into salary_log(emp_id, old_salary, new_salary)
values (old.emp_id, old.salary, new.salary);
end $$ 
Delimiter ;
# all records from the employees table.
Delimiter $$
create procedure getEmployees()
begin select * from employees;
end $$
Delimiter ;
call getEmployees();

# create a stored procedure that inserts a neew employee into the employee table using parameters


Delimiter $$
create procedure addEmployee(
IN p_id int,
IN p_name varchar(100),
IN p_salary decimal(10,2)
)

begin
insert into employee values(p_id,p_name,p_salary);
end $$
Delimiter ;
call addEmployee (5, 'hari' , 20000);

#3 create a stored procedure that update the salary of an employee based on employee ID.

delimiter $$
create procedure updateSalary(
in p_id int, in new_salary decimal(10,2))
begin 
update employee
set salary = new_salary 
where emp_id = p_id;
end $$

Delimiter ;
call updateSalary(1,30000);

#4 create aa stored procedure that transfers money between two accounts using a transaction.
Delimiter $$
create procedure transferMoney(
in from_account int, in to_account int,
in amount decimal)
begin 
start transaction;
update accounts
set balance = balance - amount
where accoount_id = from_account;
update accounts
set balance = balance +amount
where accoount_id = to_account;
commit;
end $$

Delimiter ; 
call transferMoney(1,2,5000);



















create database jio_employee_management_system;
show databases;
use jio_employee_management_system;

create table employee 
(Emp_id int(15),First_Name varchar(10),Last_Name varchar (15),Dept_Code int(4));

show tables;

insert into employee values 
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

select * from employee;

create table Department
(Dept_Code int (4),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Department 
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);

select * from Department;

# Q.1: What are the unique Last_Names from the Employee Table?

select distinct (last_name) from employee;

# Q.2: What is the total number of employees in the company?

select count(*) from employee;

# Q.3: What is the total budget for the company?

select sum(Dept_Budget) from department;

# Q.4: What is the department code and budget for the "Operations" department?

select dept_name, dept_code, dept_budget from department where dept_name = 'Operations';

# Q.5: What is the total budget for the "Information Technology" and "Finance and Accounting" departments?

select sum(dept_budget) from department where dept_name in ('information technology', 'finance and accounting');

# Q.6: Who are the employees working in the "Sales and Marketing" department?

select concat(first_name, ' ', last_name) Emp_Name from employee e inner join department d on e.dept_code = d.dept_code
where d.dept_name = "Sales and Marketing";

# Q.7: What is the name of the employee with Emp_ID 718929853?

select concat(first_name, ' ', last_name) Emp_Name, emp_id from employee where emp_id = 718929853;

# Q.8: What is the budget for the "Customer Service" department?

select dept_budget, dept_name from department where dept_name = 'customer service';

# Q.9: What is the total budget for all departments except "Operations"?

select sum(dept_budget) from department  where dept_name <> "operations";

# Q.10: What is the Emp_ID, First_Name and department_code of the employee with the last name "Shukla"?

select emp_id, first_name, dept_code from employee where last_name = 'Shukla';

# Q.11: What is the average budget for the departments with Dept_Code 23 and 43?

select avg(dept_budget) Avg_Budget from department where dept_code in (23,43);

# Q.12: How many employees are there whose first name starts with the letter "S"?

select count(*) from employee where first_name like 'S%';

# Q.13: List the name of Employees whose First_name starts with "S".

select concat(first_name, ' ', last_name) Emp_Name from employee where first_name like 'S%';

# Q.14: List the name of Employees whose First_name starts with "S" and ends with "A".

select concat(first_name, ' ', last_name) Emp_Name from employee where first_name like 'S%A';

# Q.15: Fetch Top 3 records of all the Departments in descending order based on the budget of the department.

select * from department  order by dept_budget desc limit 3;

# Q.16: Fetch data of all employees from the employee table whose dept_code is an odd number

select * from employee where dept_code%2 = 1;

# Q.17: Create a clone of the table employee with a name Clone_table and having two columns, one with full name and the other 
#with the department code with an alias D_Code

create table Clone_table select concat(first_name, ' ', Last_name) as Full_Name , Dept_code as D_Code from employee;
 
select * from clone_table;

# Q.18: Delete employee details of "Ajay Kumar" from Clone_Table

delete from clone_table where Full_Name = "Ajay Kumar";

# Q.19: The name of the employee "rahul Srivasatava" has a lower case 'r', make changes in the clone table so that the 
#full_name is written as "Rahul Srivastava" 

update clone_table
set full_name = "Rahul Srivastava"
where D_code = 66;

# Q.20: Convert Full_name from clone table into uppercase

select upper(Full_name), D_code from clone_table;

# Q.21: Fetch second to fifth record from the department table based on the Highest Budget.

select * from department order by dept_budget desc limit 1,4;

# Q.22: The employee with the name "Jalpesh Modi" has decided to move into another department, delete the D_code
# value corresponding to "Jalpesh_Modi" from the clone_table

update clone_table set D_code=null where full_name="Jalpesh Modi";

# Q.23: Change the name of the column D_Code to Department_code in clone table.

alter table clone_table rename column D_Code to Department_code;

# Q.24: Since no mathematical operation will be performed on emp_id in employee table, convert its data type from int to varchar

alter table employee modify column emp_id varchar(25);

# Q.25: The Company has decided to increase the budget of all the department by 10% , make changes accordingly 
# to fetch old and new budget

select Dept_code, Dept_name, Dept_Budget Old_Budget, Dept_budget * 1.1 as new_budget from department;
# here we multiplied by 1.1 because (1.1 is the same as 100% + 10%) so it will add 10%

# Q.26: What is the name of the department with the lowest budget?

select dept_name, dept_budget from department where dept_budget = (select min(dept_budget) from department);

# Q.27: Who are the employees working in the departments with budgets greater than 40000000?

select concat(first_name, ' ', last_name) Emp_name, dept_budget from employee 
inner join department on employee.dept_code = department.dept_code
where dept_budget > 40000000;

# 2nd way as per solutions notes.

SELECT * FROM Employee 
WHERE Dept_Code IN (SELECT Dept_Code FROM Department
WHERE Dept_Budget > 40000000);

# Q.28: What is the name of the department with the second highest budget?

select dept_name, dept_budget from Department where dept_budget = 
(select max(Dept_Budget) from Department where Dept_Budget < 
(select max(Dept_Budget) from Department));

# Q.29: How many employees are there in each department?

select count(*) as Emp_count, dept_name  from employee inner join department on employee.dept_code=department.dept_code 
group by dept_name;


# Q.30: Create a view of Employees working in Sales and Marketing department only.

create view Vt1 as select concat( first_name,' ',last_name) emp_name from employee
inner join department on employee.dept_code=department.dept_code where dept_name = 'Sales and Marketing';

select * from Vt1;

# 2nd way 

create view Vt2 as select employee.*, department.dept_name from employee
inner join department on employee.dept_code=department.dept_code where dept_name = 'Sales and Marketing';

select * from Vt2;

# COMPLETE.


/* Clean and re-structure messy data.
Convert columns to different data types.
Tricks for manipulating NULLs.
Left:
Right: 
Substr
Position
Strpos
Concat
Cast
Coalesce */
-- 1 RIGHT 

SELECT RIGHT(last_name,4) FROM customers
select RIGHT(first_name,4) from employees
select RIGHT(branch_name,4) from branch

--2 LEFT
select LEFT(city,4) from customers
SELECT LEFT(city,4) from branch
SELECT LEFT(email,4)from customers;

--3 Substr

select  SUBSTR(email,4,4) from customers
select SUBSTR(last_name,4,4) from employees
select SUBSTR(job_title,3,5) from employees

--4 CONCAT

SELECT CONCAT(first_name,last_name) from customers
SELECT CONCAT(job_title,'+',first_name) from employees
SELECT CONCAT(branch_name,city) from branch


--5 CAST

SELECT CAST(salary as int) from employees
SELECT CAST(current_balance as int) from accounts
SELECT CAST(overdraft_limit as int) from accounts

--6 Position

select POSITION('@' IN email) from customers
select POSITION('a'IN city) from branch

--7 Strpos

select STRPOS(email,'gmail') from customers
select STRPOS(city,'aa') from customers

-- 8 Coalesce

select COALESCE(overdraft_limit, current_balance) as money_from_account from accounts


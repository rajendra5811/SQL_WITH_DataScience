/*1.Display tables accounts,branch,card,luans,customers,employees,sard_tramsactions,loan_payments,fraud_alerts,transactiuns.
SELECT & FROM
LIMIT
ORDER BY
WHERE
Basic arithmetic operations
LIKE
IN
NOT
AND & BETWEEN & OR
*/

SELECT * FROM loans
Select * FROM cards
SELECT * FROM branch
SELECT * FROM accounts
select * FROM employees
select * FROM transactions

--2 LIMIT

SELECT * FROM loans LIMIT 10;
SELECT current_balance FROM accounts limit 5;
SELECT transaction_type FROM transactions order by amount desc, channel limit 4; 

--3 ORDER BY

SELECT * FROM cards order by card_network; 
SELECT * FROM loans order by loan_type; 
select * from branch order by city DESC;
select * from customers order by last_name desc,first_name;

--4 WHERE

SELECT * FROM fraud_alerts where severity ='HIGH';
SELECT * FROM loan_payments WHERE payment_status = 'MISSED';
SELECT * FROM loans WHERE loan_type='AUTO' limit 6;
select * from customers WHERE city ='Boston' order by first_name; 
select * from branch WHERE city='New York' order by branch_name limit 10; 

--5 arthimatic operation

SELECT account_id,branch_id, (overdraft_limit+current_balance) AS max_withdraw_amount FROM accounts WHERE overdraft_limit>=250;
SELECT last_name,first_name, credit_score from customers WHERE date_of_birth>'2000-09-08' limit 5;
SELECT customer_id,card_id,credit_limit,card_network from cards Where credit_limit>1000 order by card_network;
SELECT * from employees where salary>88000 order by hire_date desc, job_title;

--6 LIKE
SELECT * FROM customers WHERE last_name LIKE 'R%' order by first_name;
SELECT * FROM branch WHERE city like '%all%' 
SELECT * FROM employees where last_name like "Bro%"
SELECT * from loan_payments where payment_method like 'C%'

--7.IN AND NOT IN
select * from customers WHERE city IN ('New York', 'Dallas', 'Miami');
SELECT * from branch WHERE city not IN ('Seattle','Dallas')
SELECT * FROM employees where job_title IN('Teller','Loan Officer')
SELECT * FROM loans WHERE loan_type not in ('Auto','Student')

--8 AND & BETWEEN & OR
SELECT * FROM branch WHERE city not like '%all%' and city like '%ea%'
SELECT * FROM employees Where salary between 10000 and 50000
SELECT * FROM employees WHERE last_name = 'Reddy' or job_title= 'Teller'
SELECT * FROM loans WHERE loan_type = 'Auto' OR loan_status='CURRENT'

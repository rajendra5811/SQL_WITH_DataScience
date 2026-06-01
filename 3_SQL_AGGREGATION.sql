/*COUNT
SUM
MIN & MAX
AVG
GROUP BY
DISTINCT
HAVING
Create DATE functions*/
--1 count

SELECT count(*) from customers;
SELECT COUNT(*) FROM employees where last_name='Reddy'
SElECT count(*) from branch where city='New York'

--2 MIN

SELECT MIN(current_balance) as minimum_current_balance from accounts
SELECT MIN(credit_limit) as minimum_credit_limit from cards
select min(amount) as minimum_Amount from transactions

--3 MAX

select MAX(amount) as max_amount from card_transactions
select max(scheduled_amount) as max_scheduled_amount from loan_payments
select max(overdraft_limit) as max_overdraft_limit from accounts

--4 AVG

select avg(risk_score) as average_risk_score from fraud_alerts
select avg(amount) as average_transaction_amount from card_transactions
select avg(term_month) as average_term_month from loans

--5 GROUP BY

SELECT account_type, COUNT(*) AS total_account FROM accounts WHERE overdraft_limit > 500 GROUP BY account_type ORDER BY account_type;
SELECT loan_status,COUNT(*) AS total_loans FROM loans WHERE interest_rate > 18 GROUP BY loan_status ORDER BY total_loans DESC;
SELECT transaction_type,COUNT(*) AS total_transactions FROM transactions WHERE amount > 1000 GROUP BY transaction_id ORDER BY transaction_type;

--6 DISTINCT
select DISTINCT(last_name) from customers
select DISTINCT(city) from branch
select DISTINCT(job_title) from employees

--7 having
select AVG(risk_score) from fraud_alerts WHERE severity ='HIGH' GROUP BY alert_type HAVING COUNT(*)>5;
select AVG(credit_limit) from cards where card_network ='VISA' GROUP BY card_status having SUM(credit_limit)>0;
SELECT payment_status,max(paid_amount) AS max_paid_amount FROM loan_payments WHERE payment_method = 'MOBILE'
GROUP BY payment_status HAVING COUNT(paid_amount) > 10;

--8 DATE Functions

--Get the curent date
SELECT CURRENT_TIMESTAMP AS cur_date;
--SELECT GETDATE() AS cur_date; 2026-06-01 17:03:12.593601+05:30


--Get the date in UTC timezone

SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
--SELECT GETUTCDATE() AS cur_date; 2026-06-01 11:37:51.543749


--Extract the month names from the issued_date column in the cards table.

SELECT EXTRACT(MONTH FROM expiration_date) AS month_number,
       issued_date
FROM cards;
-- Alternatively you can also use the TRIM function to return same thing as date part
SELECT EXTRACT(MONTH FROM expiration_date) AS month_no,
       TRIM(TO_CHAR(expiration_date, 'Month')) AS month,
       issued_date
FROM cards;



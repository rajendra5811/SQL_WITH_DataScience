/* SIMPLE JOINS (OUTER)
   LEFT JOINS
   RIGHT JOINS
   NESTED JOINS
   */ 
-- 1 SIMPLE JOINS (OUTER)
SELECT c.card_id,c.credit_limit,ca_t.amount
FROM cards c
JOIN  card_transactions ca_t
ON c.card_id = ca_t.card_id

SELECT l.loan_type,l_p.payment_method
from loans l
JOIN loan_payments l_p
ON l.loan_id=l_p.loan_id;

select a.current_balance, t.amount
from accounts a
JOINS transcations t
on a.account_id=t.account_id


-- 2 . LEFT JOINS

select c.last_name,l.loan_type
from customers c
LEFT JOIN loans l
on l.customer_id=c.customer_id

select c.last_name,ca.credit_limit
from customers c
LEFT join cards ca
on c.customer_id=ca.customer_id

select b.branch_name,e.last_name
from employees e
LEFT JOIN branch b
on e.branch_id=b.branch_id

--3 RIGHT join

select t.transaction_type,a.current_balance
from accounts a
RIGHT JOIN transactions t
on a.account_id=t.account_id

select l.outstanding_balance,l_p.paid_amount
from loans l
Right join loan_payments l_p
on l.loan_id=l_p.loan_id

SELECT c.card_id,c.credit_limit,ca_t.amount
FROM cards c
RIGHT JOIN  card_transactions ca_t
ON c.card_id = ca_t.card_id

-- 4 NESTED JOINS

select *
from  accounts a
JOIN  customers ca
on a.customer_id =ca.customer_id
JOIN cards c
on c.customer_id=ca.customer_id

select * 
from loans l
JOIN employees e
on l.loan_officer_employee_id=e.employee_id
JOIN  branch b
on b.branch_id=e.branch_id


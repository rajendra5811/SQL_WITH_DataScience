/* SIMPLE JOINS (OUTER)
   LEFT JOINS
   RIGHT JOINS
   NESTED JOINS
   INNER JOINS
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

select b.branch_name,e.city
from employees e
LEFT JOIN branch b
on e.branch_id=b.branch_id
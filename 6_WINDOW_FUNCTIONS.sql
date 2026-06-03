/*
ROW_NUMBER(),RANK(),DENSE_RANK()
LAG()
LEAD()
OVER() PARTITION BY
Percentile Functions (PERCENT_RANK(), NTILE(), PERCENTILE_CONT())*/

-- 1 row number ,RANK() ,DENSE_RANK(),LAG() LEAD()

select account_id,customer_id,current_balance,
row_number() over(partition by overdraft_limit order by current_balance DESC) as high_account_holders,
rank() over(partition by overdraft_limit order by current_balance DESC) as high_account_holders,
dense_rank() over(partition by overdraft_limit order by current_balance desc) as high_acc_holder,
LAG(current_balance) over(partition by overdraft_limit order by current_balance desc) as high_acc_holder,
lead(current_balance) over(partition by overdraft_limit order by current_balance desc) as high_acc_holder
from accounts

select loan_id,principal_amount,
row_number() over(partition by loan_type order by principal_amount desc) as big_loan_holders,
rank() over(partition by loan_type order by principal_amount desc) as big_loan_holders_ppp,
dense_rank() over(partition by loan_type order by principal_amount desc) as big_loan_holders_ppm,
lag(principal_amount) over(partition by loan_type order by principal_amount desc) as high_loan_holder,
lead(principal_amount) over(partition by loan_type order by principal_amount desc) as high_loan_holders
from loans

select employee_id,job_title,salary,
row_number() over(order by salary desc) as big_earner,
rank() over(order by salary desc) as bigger_pie,
dense_rank() over(order by salary desc) as salaried_employees,
lag(salary) over(order by salary desc) as high_acc_holder_employee,
lead(salary) over(order by current_balance desc) as high_acc_holder_emp
from employees

select card_id,customer_id,credit_limit,
row_number() over(order by credit_limit desc) as premiun_cards,
rank() over(order by credit_limit desc) as max_credit_limit_cards,
dense_rank() over(order by credit_limit desc) as premiun_card_of_creditors
from cards

select alert_id,entity_id,risk_score,
row_number() over(order by risk_score ) as safety_net,
rank() over(order by risk_score ) as low_risk,
dense_rank() over(order by risk_score ) as less_risk
from fraud_alerts

--Percentile Functions (PERCENT_RANK(), NTILE(), PERCENTILE_CONT())

SELECT account_id, overdraft_limit,current_balance,
NTILE(4) OVER (PARTITION BY account_id ORDER BY current_balance) as m
FROM accounts
ORDER BY account_id DESC

SELECT job_title,PERCENTILE_DISC(0.5)
WITHIN GROUP (ORDER BY salary) AS median_salary_disc,
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY salary) AS median_salary_cont
FROM employees
GROUP BY job_title;
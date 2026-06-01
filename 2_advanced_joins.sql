/* Create fast-running queries with advanced joins
Evaluate business questions
Tune the performance of queries
Create solutions for edge-cases*/

/* [Advanced] - SQL Advanced Joins and Performance Tuning */


--1.Write a query with FULL OUTER JOIN to see: 

SELECT *
FROM cards c
FULL OUTER JOIN card_transactions c_t
ON c.card_id = c_t.card_id
limit 5; --output
/* 7269	7864	"DEBIT_STANDARD"	"DISCOVER"	"2022-01-05"	"2024-02-12"	"ACTIVE"	0.00	1	7269	"2021-07-12 23:20:10"
27281	1709	"CREDIT_TRAVEL"	"AMEX"	"2025-05-03"	"2028-11-06"	"ACTIVE"	25000.00	2	27281	"2022-02-28 15:19:19"
25982	2403	"CREDIT_BASIC"	"AMEX"	"2024-02-29"	"2029-02-06"	"ACTIVE"	10000.00	3	25982	"2022-02-22 16:15:28"
29887	9213	"CREDIT_TRAVEL"	"DISCOVER"	"2024-01-24"	"2027-01-11"	"ACTIVE"	10000.00	4	29887	"2026-03-23 20:23:51"
1105	17490	"CREDIT_REWARDS"	"MASTERCARD"	"2024-01-08"	"2027-12-27"	"BLOCKED"	25000.00	5	1105	"2026-01-24 18:15:40"*/


/*
Write a query that left joins 
*/

SELECT *
FROM loans l
LEFT JOIN loan_payments l_p
ON l.loan_id = l_p.loan_id
	LIMIT 5;
/* 15327	1515	"STUDENT"	34173.23	17.86	180	"2020-12-01"	"CURRENT"	15101.25
5072	1828	"BUSINESS"	462472.35	9.05	48	"2025-02-11"	"CURRENT"	392516.10
18795	71	"MORTGAGE"	114574.08	8.90	24	"2023-07-14"	"CURRENT"	68856.94
11668	1399	"MORTGAGE"	742534.67	10.07	360	"2024-11-12"	"CURRENT"	346029.50
8811	1468	"AUTO"	14023.79	17.91	24	"2022-02-14"	"CURRENT"	10229.76
*/

--2.Write a query that uses UNION ALL on two instances (and selecting all columns) of the loans table. 


SELECT *
FROM loans

UNION ALL

SELECT *
FROM loans
LIMIT 5;

/* 1	10	781	"PERSONAL"	31504.37	17.63	72	"2019-08-01"	"CURRENT"	25180.15
2	19506	223	"AUTO"	30602.76	11.31	360	"2020-01-16"	"CURRENT"	10823.07
3	16546	1620	"AUTO"	26381.03	17.34	180	"2021-10-04"	"CURRENT"	4507.20
4	19944	43	"AUTO"	23669.04	16.05	72	"2026-03-27"	"DELINQUENT"	16810.42
5	19872	1038	"AUTO"	41612.20	9.70	24	"2020-10-02"	"PAID_OFF"	0.00*/

--3.Perform the union in your first query (under the Appending Data via UNION header) in a common table expression.


WITH same_city AS ( 
  	SELECT city
	FROM  customers
	
	UNION ALL

	SELECT city
	FROM customers
)
  
SELECT city, COUNT(city) AS count_of_city
FROM same_city
GROUP BY city;

/*"Austin"	2342
"Chicago"	2080
"Portland"	2128
"Seattle"	2068
"Columbus"	2118
"Jersey City"	1970
"San Jose"	2006
"New York"	2026
"Phoenix"	2164
"San Francisco"	2172
"Dallas"	2080
"Richardson"	2042
"Boston"	2112
"Nashville"	2076
"Denver"	2194
"Charlotte"	2104
"Atlanta"	2162
"Bellevue"	2050
"Miami"	2106 */
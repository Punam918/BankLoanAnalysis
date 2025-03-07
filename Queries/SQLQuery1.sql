create database bank_loandb

use bank_loandb

select top 10 * from financial_loan


SELECT COUNT(id) AS Total_Applications FROM financial_loan


SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12

select distinct last_payment_date  from financial_loan

SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 11

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 12

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 11

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM finanical_data


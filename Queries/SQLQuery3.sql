-- Bad Loan
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS badloancountpercent
FROM financial_loan

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'



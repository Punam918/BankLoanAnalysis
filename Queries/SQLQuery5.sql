-- good loan percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'



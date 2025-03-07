SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11

-- dti = Debt to income
-- mtd = month to date
-- pmtd = previous month to date

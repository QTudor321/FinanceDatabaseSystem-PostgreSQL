--Functions

--Sum paid for a loan
CREATE Function TotalSumPaidForLoan(loanId INT)
RETURNS NUMERIC as $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT COALESCE(SUM(amount), 0)
    INTO total
    FROM Payment
    WHERE loan_id = loanId;
    RETURN total;
END;
$$ LANGUAGE plpgsql;
SELECT TotalSumPaidForLoan(2);

--Credit deduction after a payment
CREATE FUNCTION ReduceCreditFromAccount(accountId INT, payment NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE Account
    SET credit = credit - payment
    WHERE account_id = accountId;
END;
$$ LANGUAGE plpgsql;
SELECT * From Account
WHERE account_id=4;
SELECT ReduceCreditFromAccount(4,1000);

--Number of actions executed by an employee on loans
CREATE OR REPLACE FUNCTION CountLoanActionsByEmployee(empId INT)
RETURNS INT AS $$
DECLARE
    actionCount INT;
BEGIN
    SELECT COUNT(*) INTO actionCount
    FROM Employee_Loan
    WHERE Employee_employee_id = empId;
    RETURN actionCount;
END;
$$ LANGUAGE plpgsql;
SELECT CountLoanActionsByEmployee(7);
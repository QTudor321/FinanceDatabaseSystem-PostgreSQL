--Trigger
--Updating the status of a loan if it's completely paid
--Creating an update function, which uses the previous function to calculate total sum, which will be linked to the trigger
CREATE FUNCTION UpdateLoanStatus()
RETURNS TRIGGER AS $$
BEGIN
    IF 
		(SELECT TotalSumPaidForLoan(NEW.loan_id)) >= (SELECT amount FROM Loan WHERE loan_id = NEW.loan_id) 
	THEN
        UPDATE Loan
		SET status = 'Paid'
		WHERE loan_id = NEW.loan_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--Creating the trigger, linked to the update function
CREATE TRIGGER TriggerUpdateLoanStatus
AFTER INSERT ON Payment
FOR EACH ROW
EXECUTE FUNCTION UpdateLoanStatus();
--Verifying loan instances to check the trigger functionality on the loan status
SELECT * From Loan;
--Inserting payments to test the trigger
INSERT Into Payment(account_id, loan_id, amount, date_payment)
VALUES (1, 2, 50.00, '2025-05-01');
--Checking total payments
SELECT * From Payment;
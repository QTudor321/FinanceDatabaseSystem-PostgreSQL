--Constraints
ALTER Table Loan
ADD Constraint status_loan_check CHECK (status in ('Pending','Active','Paid','Overdue'));
ALTER Table Transaction
ADD Constraint type_transaction_check CHECK (type_transaction in ('deposit', 'withdrawal', 'transfer'));
ALTER Table Payment
ADD Constraint pay_amount_check CHECK (amount > 0);
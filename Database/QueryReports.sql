--Reports

--1. Informational list with lastnames, firstnames, idcards from users, their coresponding accounts with usernames, passwords and credit
--and their coresponding transactions with the amount higher then 1000$.
CREATE View ViewUsersTransactionsOver1000 as
SELECT Users.last_name, Users.first_name, Users.id_card,
    Account.username, Account.password, Account.credit,
    Transaction.amount, Transaction.type_transaction, Transaction.date_transaction
FROM Users
JOIN Account on Users.user_id = Account.user_id
JOIN Transaction on Account.account_id = Transaction.from_account_id
WHERE Transaction.amount > 1000;
SELECT * From ViewUsersTransactionsOver1000;

--2. Loans with expired terms and user information with lastnames, firstnames, idcards and their coresponding accounts with usernames,
--emails and credit.
CREATE View ViewOverdueLoansUserAccountInfo as
SELECT Users.last_name, Users.first_name, Users.id_card,
    Account.username, Account.email, Account.credit,
    Loan.loan_id, Loan.amount, Loan.term_months, Loan.date_loan, Loan.status
FROM Loan
JOIN Account on Loan.account_id = Account.account_id
JOIN Users on Account.user_id = Users.user_id
WHERE Loan.status = 'Overdue';
SELECT * From ViewOverdueLoansUserAccountInfo;

--3. Employees and their 'updated' actions on the accounts.
CREATE View ViewEmployeeUpdateAccountActions as
SELECT Employee.name, Employee_Account.action_e_a, Employee_Account.comment, Employee_Account.Account_account_id
FROM Employee
JOIN Employee_Account on Employee.employee_id = Employee_Account.Employee_employee_id
WHERE Employee_Account.action_e_a = 'updated';
SELECT * From ViewEmployeeUpdateAccountActions;

--4. Log list in the last 3 weeks starting from 2025-04-01.
CREATE View ViewLogsLast3Weeks as
SELECT *
FROM Log
WHERE timestamp_log >= '2025-04-01';
SELECT * From ViewLogsLast3Weeks;

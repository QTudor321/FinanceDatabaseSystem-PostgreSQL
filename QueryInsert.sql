--Insert
INSERT Into Users(admin_id, last_name, first_name, address, phone, id_card)
VALUES (1,'Popescu','Gabriel','Str. Vinului 23','0788234123','5093903423451'),
(1,'Oprea','Ovidiu','Str. Oltului 01','0712333123','5111100001111'),
(3,'Quentin','Kevin-John','Str. Iancu 17','0762345938','5029312348594'),
(4,'Boyka','Yuri','Str. Dambovitei 177','0723823812','5039301011010'),
(4,'Hector','Victor','Str. Kogalniceanului 33','0777777273','5777838383333');
INSERT Into Account(user_id, username, email, password, credit)
VALUES (5,'Hect123','hectorvictor333@gmail.com','Hectorpass333',3000.70),
(4,'Yuri123','yuriboyka732@gmail.com','YuriBFighter!',7000000.00),
(2,'Oprea3','ovidiu123@gmail.com','oltului01',1500.00),
(2,'OviCool333','ovidiu333@outlook.com','Ovidiupass123',25000.00),
(2,'JohnOsome','ovidiuoprea@yahoo.com','_Ovi_',10000.00);
INSERT Into Loan(account_id, amount, interest_rate, term_months, date_loan, status)
VALUES (2, 32000.00, 960.00, 36, '2025-04-17', 'Pending'),
(1, 500.00, 50.00, 11, '2025-03-01', 'Active'),
(1, 500.00, 50.00, 11, '2024-05-20', 'Paid'),
(1, 500.00, 50.00, 11, '2024-01-03', 'Overdue'),
(5, 3000.00, 370, 10, '2025-03-17', 'Active');
INSERT Into Payment(account_id, loan_id, amount, date_payment)
VALUES (5, 5, 370.00, '2025-04-17'),
(1, 2, 17.00, '2025-03-13'),
(1, 2, 23.00, '2025-03-17'),
(1, 2, 10.00, '2025-04-17'),
(1, 4, 550.00, '2025-04-17');
INSERT Into Transaction(from_account_id, to_account_id, type_transaction, amount, date_transaction)
VALUES (2, Null, 'deposit', 30000.00, '2023-02-27'),
(4, Null, 'withdrawal', 1500.70, '2025-04-11'),
(5, 3, 'transfer', 3000.00, '2020-02-20'),
(4, 3, 'transfer', 1500.00, '2023-11-09'),
(4, 3, 'transfer', 3000.00, '2024-12-12');
INSERT Into Employee(name, role)
VALUES ('Gregory','LoanOfficer'),
('Tomas','Teller'),
('Walter','Manager'),
('Laurent','Analyst'),
('Jimmy','Analyst'),
('Peter','Teller'),
('Andrew','LoanOfficer');
INSERT Into Admin(name, permissions)
VALUES ('Ulrich','ManageUsers'),
('Ionel','ViewLogs'),
('TudorO','ManageUsersLogsAccounts'),
('Kevin','ManageUsersAccounts'),
('Jack','ManageLogsViewUsersAccounts');
INSERT Into Log(user_id, employee_id, admin_id, action, timestamp_log, target)
VALUES (2, Null, Null, 'Ovidiu transfered money into Hectors account with ID 1', '2025-03-03 11:30:00', 5),
(Null, 1, Null, ' Ulrich accepted the loan with ID 1', '2025-04-16 11:30:00', 2),
(Null, 6, Null, 'Peter handled the withdrawal with ID 2 from account with ID 4', '2025-04-11 11:30:00', 4),
(Null, Null, 3, 'TudorO updated accounts information with ID ', '2023-10-11 11:30:00', 3),
(Null, Null, 2, 'requested to view the logs', '2025-02-14 17:55:00', 2)
(Null, Null, 2, 'requested to view the logs AGAIN', '2025-03-11 17:55:00', 2);
INSERT Into Employee_Loan (Employee_employee_id, Loan_loan_id, action_e_l, comment)
VALUES (1, 1,'approved', 'Verified documents and approved loan.'),
(7, 1,'verified', 'Verified loan.'),
(1, 4,'analyse', 'Analysed loan which is overdue.'),
(7,4,'updated', 'Updated documents and set loan as overdue.'),
(7, 5,'added', 'Added loan for a user.'),
(1, 4,'analyse','Analysed again the loan.');
INSERT Into Employee_Transaction(Employee_employee_id, Transaction_transaction_id, action_e_t, comment)
VALUES (2, 3, 'approved', 'Employee verified information and approved transaction into account.'),
(2, 1, 'approved','Approved depozit into account.'),
(6, 4,'denied', 'Denied transaction since the account has invalid information.'),
(6, 3,'verified', 'Verified information about transaction.'),
(6, 5,'updated', 'Updated transaction information.');
INSERT Into Employee_Account(Employee_employee_id, Account_account_id, action_e_a, comment)
VALUES (3, 2, 'updated', 'Updated account credit.'),
(4, 2, 'verified', 'Verified account information.'),
(3, 5, 'locked', 'Locked account because of suspicious information.'),
(3, 3, 'denied', 'Denied account creation because of spam.'),
(5, 4, 'approved', 'Approved account creation for new user.'),
(3, 2, 'verified', 'Verified account information to check credit.');
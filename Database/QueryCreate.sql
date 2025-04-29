--Create
CREATE Database financial_system;
CREATE Table Users(
	user_id SERIAL PRIMARY KEY,
	admin_id INT Null,
	FOREIGN KEY (admin_id) REFERENCES Admin(admin_id) ON DELETE SET NULL,
	last_name VARCHAR(50) Not Null,
	first_name VARCHAR(50) Not Null,
	address VARCHAR(50) Not Null,
	phone VARCHAR(10) UNIQUE Not Null,
	id_card VARCHAR(13) UNIQUE Not Null
);
CREATE Table Account(
	account_id SERIAL PRIMARY KEY,
	user_id INT Not Null,
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
	username VARCHAR(50) UNIQUE Not Null,
	email VARCHAR(100) UNIQUE Not Null,
	password VARCHAR(50) Not Null,
	credit NUMERIC(10,2) Not Null
);
CREATE Table Loan(
	loan_id SERIAL PRIMARY KEY,
	account_id INT Not Null,
	FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
	amount NUMERIC(10,2) Not Null,
	interest_rate NUMERIC(10,2) Not Null,
	term_months INT Not Null,
	date_loan DATE Not Null,
	status VARCHAR(10) Not Null
);
CREATE Table Payment(
	payment_id SERIAL PRIMARY KEY,
	account_id INT Not Null,
	loan_id INT Not Null,
	FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
	FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE,
	amount NUMERIC(10,2) Not Null,
	date_payment DATE Not Null
);
CREATE Table Transaction(
	transaction_id SERIAL PRIMARY KEY,
	from_account_id INT Not Null,
	to_account_id INT Null,
	FOREIGN KEY (from_account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
	FOREIGN KEY (to_account_id) REFERENCES Account(account_id) ON DELETE SET NULL,
	type_transaction VARCHAR(50) Not Null,
	amount NUMERIC(10,2) Not Null,
	date_transaction DATE Not Null
);
CREATE Table Employee(
	employee_id SERIAL PRIMARY KEY,
	admin_id INT Null,
	FOREIGN KEY (admin_id) REFERENCES Admin(admin_id) ON DELETE SET NULL,
	name VARCHAR(50) UNIQUE Not Null,
	role VARCHAR(50) Not Null
);
CREATE Table Admin(
	admin_id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE Not Null,
	permissions VARCHAR(50) Not Null
);
CREATE Table Log(
	log_id SERIAL PRIMARY KEY,
	user_id INT Null,
	employee_id INT Null,
	admin_id INT Null,
	FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE SET NULL,
	FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE SET NULL,
	FOREIGN KEY (admin_id) REFERENCES Admin(admin_id) ON DELETE SET NULL,
	action VARCHAR(100) Not Null,
	timestamp_log TIMESTAMP Not Null,
	target INT Not Null
);
CREATE TABLE Employee_Loan
(
	id_el SERIAL PRIMARY KEY,
    Employee_employee_id INT Not Null,
    Loan_loan_id INT Not Null,
	FOREIGN KEY (Employee_employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (Loan_loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE,
	action_e_l VARCHAR(50) Not Null,
	comment TEXT Not Null
);
CREATE TABLE Employee_Account
(
	id_ea SERIAL PRIMARY KEY,
    Employee_employee_id INT Not Null,
    Account_account_id INT Not Null,
	FOREIGN KEY (Employee_employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (Account_account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
	action_e_a VARCHAR(50) Not Null,
	comment TEXT Not Null
);
CREATE TABLE Employee_Transaction
(
	id_et SERIAL PRIMARY KEY,
    Employee_employee_id INT Not Null,
    Transaction_transaction_id INT Not Null,
	FOREIGN KEY (Employee_employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (Transaction_transaction_id) REFERENCES Transaction(transaction_id) ON DELETE CASCADE,
	action_e_t VARCHAR(50) Not Null,
	comment TEXT Not Null
);
--Views
CREATE View User_Information as
SELECT Users.user_id, Users.last_name, Users.first_name, Users.id_card,
Account.username, Account.email, Account.password, Account.credit
FROM Users
JOIN Account on Users.user_id=Account.user_id;
SELECT * From User_Information;

CREATE View Transaction_Over_10000 as
SELECT Users.user_id, Users.last_name, Users.id_card,
Account.username, Account.credit,
Transaction.transaction_id, Transaction.from_account_id, Transaction.to_account_id, Transaction.date_transaction, Transaction.amount
FROM Transaction
JOIN Account on Transaction.from_account_id=Account.account_id
JOIN Users on Account.user_id=Users.user_id
WHERE Transaction.amount > 10000;
SELECT * From Transaction_Over_10000;

CREATE View Logs_High_Level_Admin as
SELECT Log.admin_id, Log.action, Log.timestamp_log, Log.target,
Admin.name, Admin.permissions
From Log
JOIN Admin on Log.admin_id=Admin.admin_id
WHERE Admin.permissions='ManageUsersLogsAccounts';
SELECT * From Logs_High_Level_Admin;
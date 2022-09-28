TRUNCATE TABLE user_accounts, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO user_accounts (username, email) VALUES ('cool username 7', 'coolestdude7@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('lightning_lord89', 'thunderlord89@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('username8', 'username8@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('exampleusername', 'exampleemail@gmail.com');
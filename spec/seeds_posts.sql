TRUNCATE TABLE user_accounts, posts RESTART IDENTITY; -- replace with your own table name.



INSERT INTO user_accounts (username, email) VALUES ('cool username 7', 'coolestdude7@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('lightning_lord89', 'thunderlord89@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('username8', 'username8@gmail.com');
INSERT INTO user_accounts (username, email) VALUES ('exampleusername', 'exampleemail@gmail.com');

INSERT INTO posts (title, content, views, user_account_id) VALUES ('Good work on this exercise', 'nah not readlly', 12, '1');
INSERT INTO posts (title, content, views, user_account_id) VALUES ('Some title', 'that was a title', 100, '2');
INSERT INTO posts (title, content, views, user_account_id) VALUES ('Hello World', 'I know SQL', 2, '3');
INSERT INTO posts (title, content, views, user_account_id) VALUES ('Great work 47', 'Escape through the nearest...', 1, '4');
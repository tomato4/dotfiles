CREATE USER 'tomato'@localhost IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'tomato'@localhost IDENTIFIED BY '12345';
FLUSH PRIVILEGES;

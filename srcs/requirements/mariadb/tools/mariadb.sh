#!bin/sh

service mariadb start

# Wait for MariaDB to be ready
echo "MariaDB started."

# Execute SQL commands to create the database and user
mysql -u root -e "CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${db_name};"
mysql -u root -e "GRANT ALL ON ${db_name}.* TO '${db_user}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld -u mysql
#!/bin/sh

# Start the MariaDB server in the background
mysqld_safe --skip-networking &

# Wait for MariaDB to be ready
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 2
done

echo "MariaDB started."

# Execute SQL commands to create the database and user
mysql <<EOF
CREATE DATABASE IF NOT EXISTS db1;
CREATE USER IF NOT EXISTS 'NewUser'@'%' IDENTIFIED BY '123lol';
GRANT ALL PRIVILEGES ON db1.* TO 'NewUser'@'%';
ALTER USER 'SuperUser'@'localhost' IDENTIFIED BY 'MEGAMOD';
FLUSH PRIVILEGES;
EOF

# Shut down the MariaDB server
mysqladmin shutdown

# Start MariaDB in the foreground (container's main process)
exec mysqld

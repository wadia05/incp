#!/bin/bash
echo "Starting MariaDB setup..."

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to start..."
until mysqladmin ping -h localhost --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

echo "MariaDB is ready. Configuring database..."

# Configure database with root password
mariadb -u root -p${MYSQL_ROOT_PASSWORD} <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
FLUSH PRIVILEGES;
EOF

echo "Database configuration completed."

# Stop the service to restart with proper configuration
service mariadb stop

echo "Starting MariaDB in daemon mode..."

# Start MariaDB daemon with proper configuration
exec mysqld_safe --user=mysql --datadir='/var/lib/mysql' --bind-address=0.0.0.0
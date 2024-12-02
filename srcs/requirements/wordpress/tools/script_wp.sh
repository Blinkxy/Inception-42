#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    echo "WordPress is installing ..."
    cd /var/www/html
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp --allow-root --path=/var/www/html/ core download
    wp --allow-root --path=/var/www/html/ config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_pwd --dbhost=mariadb:3306
    wp --allow-root --path=/var/www/html/ core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_name=$WP_MOD_USR --admin_password=$WP_MOD_PWD --admin_email=$WP_MOD_EMAIL
    wp --allow-root user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD
    chown -R www-data:www-data /var/www/html
else
    echo "WordPress is already installed!"
fi

exec php-fpm8.2 -F
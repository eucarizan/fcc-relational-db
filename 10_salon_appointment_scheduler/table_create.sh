#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo "$($PSQL "DROP DATABASE salon") salon"

if [[ -a create.sql ]]; then
  rm create.sql
else
  touch create.sql
fi

echo "CREATE DATABASE salon"
echo "CREATE DATABASE salon;" >> create.sql
echo "" >> create.sql
echo "\connect salon;" >> create.sql
echo "" >> create.sql
echo "CREATE TABLE customers"
echo "CREATE TABLE customers(" >> create.sql
echo "  customer_id SERIAL PRIMARY KEY NOT NULL," >> create.sql
echo "  phone VARCHAR(15) UNIQUE," >> create.sql
echo "  name VARCHAR(50)" >> create.sql
echo ");" >> create.sql
echo "" >> create.sql
echo "CREATE TABLE services"
echo "CREATE TABLE services(" >> create.sql
echo "  service_id SERIAL PRIMARY KEY NOT NULL," >> create.sql
echo "  name VARCHAR(50)" >> create.sql
echo ");" >> create.sql
echo "" >> create.sql
echo "CREATE TABLE appointments"
echo "CREATE TABLE appointments(" >> create.sql
echo "  appointment_id SERIAL PRIMARY KEY NOT NULL," >> create.sql
echo "  customer_id INT REFERENCES customers(customer_id)," >> create.sql
echo "  service_id INT REFERENCES services(service_id)," >> create.sql
echo "  time VARCHAR(50)" >> create.sql
echo ");" >> create.sql
echo "" >> create.sql
echo "INSERT INTO services (name) VALUES ('cut'), ('color'), ('trim');" >> create.sql

psql --username=freecodecamp --dbname=postgres -f create.sql




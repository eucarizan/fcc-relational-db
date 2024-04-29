#!/bin/bash
psql -U freecodecamp -d postgres -c "CREATE DATABASE bikes;"
psql -U freecodecamp -d postgres -c "\l"
psql -U freecodecamp -d postgres -c "\c bikes"
psql -U freecodecamp -d bikes -c "CREATE TABLE bikes();"
psql -U freecodecamp -d bikes -c "\d"
psql -U freecodecamp -d bikes -c "ALTER TABLE bikes ADD COLUMN bike_id SERIAL PRIMARY KEY;"
psql -U freecodecamp -d bikes -c "\d bikes"
psql -U freecodecamp -d bikes -c "ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;"
psql -U freecodecamp -d bikes -c "\d bikes"
psql -U freecodecamp -d bikes -c "ALTER TABLE bikes ADD COLUMN size INT NOT NULL;"
psql -U freecodecamp -d bikes -c "ALTER TABLE bikes ADD COLUMN available BOOLEAN NOT NULL DEFAULT TRUE;"
psql -U freecodecamp -d bikes -c "\d bikes"
psql -U freecodecamp -d bikes -c "CREATE TABLE customers();"
psql -U freecodecamp -d bikes -c "ALTER TABLE customers ADD COLUMN customer_id SERIAL PRIMARY KEY;"
psql -U freecodecamp -d bikes -c "\d customers"
psql -U freecodecamp -d bikes -c "ALTER TABLE customers ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;"
psql -U freecodecamp -d bikes -c "ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;"
psql -U freecodecamp -d bikes -c "\d customers"
psql -U freecodecamp -d bikes -c "CREATE TABLE rentals();"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD COLUMN rental_id SERIAL PRIMARY KEY;"
psql -U freecodecamp -d bikes -c "\d rentals"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD COLUMN customer_id INT NOT NULL;"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);"
psql -U freecodecamp -d bikes -c "\d rentals"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD COLUMN bike_id INT NOT NULL;"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id);"
psql -U freecodecamp -d bikes -c "\d rentals"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD COLUMN date_rented DATE NOT NULL DEFAULT NOW();"
psql -U freecodecamp -d bikes -c "\d rentals"
psql -U freecodecamp -d bikes -c "ALTER TABLE rentals ADD COLUMN date_returned DATE;"
psql -U freecodecamp -d bikes -c "\d rentals"
psql -U freecodecamp -d bikes -c "\d"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('Mountain', 27);"
psql -U freecodecamp -d bikes -c "SELECT * FROM bikes;"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('Mountain', 28);"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('Mountain', 29);"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('Road', 27);"
psql -U freecodecamp -d bikes -c "SELECT * FROM bikes;"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('Road', 28), ('Road', 29);"
psql -U freecodecamp -d bikes -c "INSERT INTO bikes (type, size) VALUES ('BMX', 19), ('BMX', 20), ('BMX', 21);"
psql -U freecodecamp -d bikes -c "SELECT * FROM bikes;"
# done ddl from psql
touch bike-shop.sh
echo '#!/bin/bash' > bike-shop.sh
echo 'echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"' >> bike-shop.sh
chmod +x bike-shop.sh 
./bike-shop.sh 
echo -e "MAIN_MENU() {\n}" >> bike-shop.sh 
sed -i '6i \ \ echo "How may I help you?"' bike-shop.sh 
echo -e "\nMAIN_MENU" >> bike-shop.sh 
./bike-shop.sh 
sed -i '7i  \ \ echo -e "\\n1. Rent a bike\\n2. Return a bike\\n3. Exit"' bike-shop.sh 
sed -i '8i \ \ read MAIN_MENU_SELECTION' bike-shop.sh 
sed -i '11i RENT_MENU() {\n}\n' bike-shop.sh 
sed -i '12i \ \ echo Rent Menu' bike-shop.sh 
sed -i '15i RETURN_MENU() {\n}\n' bike-shop.sh 
sed -i '16i \ \ echo Return Menu' bike-shop.sh 
sed -i '19i EXIT() {\n}\n' bike-shop.sh 
sed -i '20i \ \ echo -e "\\nThank you for stopping in.\\n"' bike-shop.sh 
# adding case statement
sed -i '9i \ \ case $MAIN_MENU_SELECTION in\n\ \ \ \ 1) RENT_MENU ;;\n\ \ \ \ 2) RETURN_MENU ;;\n\ \ \ \ 3) EXIT ;;\n\ \ \ \ *) MAIN_MENU ;;\n\ \ esac' bike-shop.sh 
./bike-shop.sh 
# adding argument in case statement
sed -ri '13s/(;;)/\"Please enter a valid option.\" \1/' bike-shop.sh 
sed -i '6i \ \ if [[ $1 ]]; then\n\ \ \ \ echo -e "\\n$1"\n\ \ fi' bike-shop.sh 
./bike-shop.sh 
sed -ie '21d' bike-shop.sh 
# rent menu
sed -i '21i \ \ # get available bikes\n\ \ # if no bikes available\n\ \ # send to main menu' bike-shop.sh
sed -i '2i PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"' bike-shop.sh
# get available bikes
sed -i '23i \ \ AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id;")\n' bike-shop.sh
sed -i '24i \ \ echo "$AVAILABLE_BIKES"' bike-shop.sh
./bike-shop.sh
psql -U freecodecamp -d bikes -c "UPDATE bikes SET available = false WHERE available = true;"
./bike-shop.sh
# if no available bikes
sed -ie '27d' bike-shop.sh
sed -i '27i \ \ if [[ -z $AVAILABLE_BIKES ]]; then\n\ \ \ \ # send to main menu\n\ \ fi' bike-shop.sh
sed -i "29i \ \ \ \ MAIN_MENU \"Sorry, we don't have any bikes available right now.\"" bike-shop.sh
./bike-shop.sh
# if there are available bikes
sed -i '30i \ \ else\n\ \ \ \ # display available bikes\n\ \ \ \ # ask for bike to rent\n\ \ \ \ # if input is not a number\n\ \ \ \ # send to main menu' bike-shop.sh
sed -i '32i \ \ \ \ echo -e "\\nHere are the bikes we have available:"' bike-shop.sh
sed -ie '24d' bike-shop.sh
sed -i '32i \ \ \ \ echo "$AVAILABLE_BIKES"\n' bike-shop.sh
# PSQL = "psql -U freecodecamp -d bikes -c"
$PSQL "UPDATE bikes SET available = true WHERE type != 'BMX';"
./bike-shop.sh
# pipe available bikes to read
sed -ri '32s/(.*)/\1 | while read BIKE_ID BAR TYPE BAR SIZE\n\ \ \ \ do\n\ \ \ \ \ \ echo "$BIKE_ID $TYPE $SIZE"\n\ \ \ \ done/' bike-shop.sh
./bike-shop.sh
sed -ri '34s/.*/      echo "\$BIKE_ID\) \$SIZE\\\" \$TYPE Bike"/' bike-shop.sh
./bike-shop.sh
sed -i '38i \ \ \ \ echo -e "\\nWhich one would you like to rent?" \n' bike-shop.sh
sed -i '39i \ \ \ \ read BIKE_ID_TO_RENT' bike-shop.sh
# checking if 'a' is/contains a number
# prints 1 for false, 0 for true
[[ a =~ [0-9] ]]; echo $?
[[ a1 =~ [0-9] ]]; echo $?
# check start and end of pattern
[[ a1 =~ ^[0-9]$ ]]; echo $? # 1
[[ 1 =~ ^[0-9]$ ]]; echo $? # 0
[[ 11 =~ ^[0-9]$ ]]; echo $? # 1
[[ 11 =~ ^[0-9]+$ ]]; echo $? # 0
[[ ! 11 =~ ^[0-9]+$ ]]; echo $? # 1
# check if bike_to_rent input is not a number
sed -i '42i \ \ \ \ if [[ ! $BIKE_ID_TO_RENT =~ ^[0-9]+$ ]]; then\n\ \ \ \ \ \ # send to main menu\n\ \ \ \ fi' bike-shop.sh
sed -ie '45d' bike-shop.sh
sed -i '44i \ \ \ \ \ \ MAIN_MENU "That is not a valid bike number."' bike-shop.sh
./bike-shop.sh # test bike_id_to_rent not a number
sed -i '45i \ \ \ \ else\n\ \ \ \ \ \ # get bike availability\n\ \ \ \ \ \ # if not available\n\ \ \ \ \ \ # send to main menu' bike-shop.sh
# get bike availability
sed -i '47i \ \ \ \ \ \ BIKE_AVAILABILITY=$($PSQL "SELECT available FROM bikes WHERE bike_id = $BIKE_ID_TO_RENT AND available = true;")\n' bike-shop.sh
sed -i '48i \ \ \ \ \ \ echo $BIKE_AVAILABILITY' bike-shop.sh
./bike-shop.sh
# if bike selected is not available
sed -ri '51s/(\s+)(#.*)/\1if [[ -z $BIKE_AVAILABILITY ]]; then\n\1  \2\n\1fi\n/' bike-shop.sh
sed -i '53i \ \ \ \ \ \ \ \ MAIN_MENU "That bike is not available."' bike-shop.sh
sed -ie '48d' bike-shop.sh
./bike-shop.sh # rent a bike that is not available
$PSQL "UPDATE bikes SET available = true;"
# if bike is available
# customer arguments
sed -i "53i \ \ \ \ \ \ else\n\ \ \ \ \ \ \ \ # get customer info\n\ \ \ \ \ \ \ \ # if customer doesn't exist\n\ \ \ \ \ \ \ \ # get new customer name\n\ \ \ \ \ \ \ \ # insert new customer" bike-shop.sh
# get phone number
sed -i "55i \ \ \ \ \ \ \ \ echo -e \"\\\nWhat's your phone number?\"\n" bike-shop.sh
sed -i "56i \ \ \ \ \ \ \ \ read PHONE_NUMBER" bike-shop.sh
sed -i "57i \ \ \ \ \ \ \ \ CUSTOMER_NAME=\$(\$PSQL \"SELECT name FROM customers WHERE phone = '\$PHONE_NUMBER';\")" bike-shop.sh
# if customer not exist
sed -ri '60s/(\s+)(#.*)/\1if [[ -z $CUSTOMER_NAME ]]; then\n\1  \2/' bike-shop.sh
sed -ri '62s/(\s+)(#.*)/\1  \2\n\1fi/' bike-shop.sh
sed -i "62i \ \ \ \ \ \ \ \ \ \ echo -e \"\\\nWhat's your name?\"\n" bike-shop.sh
sed -i "63i \ \ \ \ \ \ \ \ \ \ read CUSTOMER_NAME" bike-shop.sh
# insert new customer
sed -i "66i \ \ \ \ \ \ \ \ \ \ INSERT_CUSTOMER_RESULT=\$(\$PSQL \"INSERT INTO customers (phone, name) VALUES ('\$PHONE_NUMBER', '\$CUSTOMER_NAME');\")" bike-shop.sh
./bike-shop.sh
$PSQL "SELECT * FROM customers;"
$PSQL "SELECT * FROM rentals;"
$PSQL "SELECT * FROM bikes;"
# update rentals table and rented bike availability
sed -ri '67s/(\s+)fi/\1fi\n\n\1# get customer_id\n\1# insert bike rental\n\1# set bike availability to false\n\1# get bike info\n\1# send to main menu\n/' bike-shop.sh
# get customer id
sed -ri "70s/(\s+)(#.*)/\1CUSTOMER_ID=\$(\$PSQL \"SELECT customer_id FROM customers WHERE phone = '\$PHONE_NUMBER';\")\n\1\2/" bike-shop.sh
# insert bike rental
sed -ri "72s/(\s+)(#.*)/\1INSERT_RENTAL_RESULT=\$(\$PSQL \"INSERT INTO rentals (customer_id, bike_id) VALUES (\$CUSTOMER_ID, \$BIKE_ID_TO_RENT);\")\n\1\2/" bike-shop.sh
# set bike availability to false
sed -ri "74s/(\s+)(#.*)/\1SET_TO_FALSE_RESULT=\$(\$PSQL \"UPDATE bikes SET available = false WHERE bike_id = \$BIKE_ID_TO_RENT;\")\n\1\2/" bike-shop.sh
$PSQL "SELECT * FROM rentals;"
$PSQL "SELECT * FROM bikes ORDER BY bike_id;"
# get bike info
sed -ri "76s/(\s+)(#.*)/\1BIKE_INFO=\$(\$PSQL \"SELECT size, type FROM bikes WHERE bike_id = \$BIKE_ID_TO_RENT;\")\n\1\2/" bike-shop.sh
sed -ri "77s/(\s+)(#.*)/\1echo \$BIKE_INFO\n\1\2/" bike-shop.sh
./bike-shop.sh
echo '28 | Mountain' | sed 's/ /=/g'
echo '28 | Mountain' | sed 's/ //g'
echo '28 | Mountain' | sed 's/ //'
echo '28 | Mountain' | sed 's/ |//'
echo '28 | Mountain' | sed 's/ |/"/'
sed -ri "77s/(.*)/\1 \| sed 's\/ \|\/\"\/'/" bike-shop.sh
./bike-shop.sh
sed -ri "77s/(\s+)(.*)/\1BIKE_INFO_FORMATTED=\$(\2)/" bike-shop.sh
sed -i '79i \ \ \ \ \ \ \ \ MAIN_MENU "I have put you down for the \$BIKE_INFO_FORMATTED Bike, \$CUSTOMER_NAME."' bike-shop.sh
./bike-shop.sh
echo ' M e '
echo "$(echo ' M e ')."
echo "$(echo ' M e ' | sed 's/ //')."
echo "$(echo ' M e ' | sed 's/ //g')."
echo "$(echo ' M e ' | sed 's/^ //g')."
echo "$(echo '   M e ' | sed 's/^ //g')."
echo "$(echo '   M e ' | sed 's/^ *//g')."
echo "$(echo '   M e ' | sed 's/ $//g')."
echo "$(echo '   M e   ' | sed 's/ $//g')."
echo "$(echo '   M e   ' | sed 's/ *$//g')."
echo "$(echo '   M e   ' | sed 's/^ *| *$//g')."
man sed
echo "$(echo '   M e   ' | sed -r 's/^ *| *$//g')."
# trim spaces of customer name
sed -ri "79s/(\s+)(.*)/\1MAIN_MENU \"I have put you down for the \$BIKE_INFO_FORMATTED Bike, \$(echo \$CUSTOMER_NAME | sed -r 's\/^ *\| *\$\/\/g').\"/" bike-shop.sh
./bike-shop.sh
./bike-shop.sh
./bike-shop.sh
$PSQL "SELECT * FROM bikes ORDER BY bike_id;"
$PSQL "SELECT * FROM customers;"
$PSQL "SELECT * FROM rentals;"
# work on return menu
sed -ie '86d' bike-shop.sh
# get customer info
sed -i '86i \ \ # get customer info\n\ \ # if not found\n\ \ # send to main menu' bike-shop.sh
sed -ri "87s/(\s+)(.*)/\1echo -e \"\\\nWhat's your phone number?\"\n\1\n\1\2/" bike-shop.sh
sed -ri "88s/(\s+)/\1read PHONE_NUMBER\n\1/" bike-shop.sh
# get customer id from db
sed -ri "89s/(\s+)/\1CUSTOMER_ID=\$(\$PSQL \"SELECT customer_id FROM customers WHERE phone = '\$PHONE_NUMBER';\")\n\1/" bike-shop.sh
sed -ri "92s/(\s+)(#.*)/\1if [[ -z \$CUSTOMER_ID ]]; then\n\1  \2\n\1  \n\1fi/" bike-shop.sh
sed -ri "94s/(\s+)/\1MAIN_MENU \"I could not find a record for that phone number.\"\n\1/" bike-shop.sh
./bike-shop.sh
sed -ri "95s/(\s+)/  else\n\1# get customer's rentals\n\1# if no rentals\n\1\1# send to main menu\n\1\1/" bike-shop.sh
# will be starting to use joins
$PSQL "SELECT * FROM bikes;"
$PSQL "SELECT * FROM bikes LEFT JOIN rentals USING (bike_id);"
$PSQL "SELECT * FROM bikes INNER JOIN rentals USING (bike_id);" # only bikes that being rented, inner join
$PSQL "SELECT * FROM bikes INNER JOIN rentals USING (bike_id) INNER JOIN customers USING (customer_id);"
$PSQL "SELECT * FROM bikes INNER JOIN rentals USING (bike_id) INNER JOIN customers USING (customer_id) WHERE phone = '555-5555' AND date_returned IS NULL;"
$PSQL "SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING (bike_id) INNER JOIN customers USING (customer_id) WHERE phone = '555-5555' AND date_returned IS NULL;"
$PSQL "SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING (bike_id) INNER JOIN customers USING (customer_id) WHERE phone = '555-5555' AND date_returned IS NULL ORDER BY bike_id;"
# get customer's rentals
sed -ri "97s/(\s+)(#.*)/\1CUSTOMER_RENTALS=\$(\$PSQL \"SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING (bike_id) INNER JOIN customers USING (customer_id) WHERE phone = '\$PHONE_NUMBER' AND date_returned IS NULL ORDER BY bike_id;\")\n\1\n\1\2\n\1/" bike-shop.sh
sed -ri "98s/(\s+)/\1echo \"\$CUSTOMER_RENTALS\"\n\1/" bike-shop.sh
./bike-shop.sh
# return to menu if no retnals
sed -ri "101s/(\s+)/\1if [[ -z \$CUSTOMER_RENTALS ]]; then/" bike-shop.sh
sed -i "103i \ \ \ \ fi" bike-shop.sh
sed -ri "102s/(\s+)(#.*)/\1\2\n\1MAIN_MENU \"You do not have any bikes rented.\"\n\1/" bike-shop.sh
sed -ri "104s/(\s+)/\ \ \ \ else\n\1# display rented bikes\n\1# ask for bike to return\n\1# if not a number\n\1# send to main menu\n\1/" bike-shop.sh
# display rentals 
sed -ri "106s/(\s+)(#.*)/\1echo -e \"\\\nHere are your rentals:\"\n\1\n\1\2/" bike-shop.sh
sed -ri "107s/(\s+)/\1echo \"\$CUSTOMER_RENTALS\"\n\1/" bike-shop.sh
sed -i '98d' bike-shop.sh
./bike-shop.sh
sed -ri '106s/(\s+)(.*)/\1\2 \| while read BIKE_ID BAR TYPE BAR SIZE\n\1do\n\1  echo \"\$BIKE_ID\) \$SIZE\\\" \$TYPE Bike\"\n\1done/' bike-shop.sh
./bike-shop.sh
# ask for bike return
sed -ri '112s/(\s+)(#.*)/\1echo -e \"\\nWhich one would you like to return?\"\n\1\n\1\2/' bike-shop.sh
sed -ri '113s/(\s+)/\1read BIKE_ID_TO_RETURN\n\1/' bike-shop.sh
sed -ri '116s/(\s+)(#.*)/\1if [[ ! \$BIKE_ID_TO_RETURN =~ ^[0-9]+$ ]]; then\n\1  \2\n\1\n\1# else\n\1  \n\1fi/' bike-shop.sh
sed -ri '118s/(\s+)/\1MAIN_MENU \"That is not a valid bike number.\"/' bike-shop.sh
sed -ri '119s/(\s+)#\ /\1/' bike-shop.sh
sed -ri '120s/(\s+)/\1# check if input is rented\n\1# if input not rented\n\1# send to main menu\n\1/' bike-shop.sh
$PSQL "SELECT * FROM rentals INNER JOIN customers USING (customer_id);"
$PSQL "SELECT * FROM rentals INNER JOIN customers USING (customer_id) WHERE phone = '555-5555' AND bike_id = 1 AND date_returned IS NULL;"
$PSQL "SELECT rental_id FROM rentals INNER JOIN customers USING (customer_id) WHERE phone = '555-5555' AND bike_id = 1 AND date_returned IS NULL;"
sed -ri "121s/(\s+)(#.*)/\1RENTAL_ID=\$(\$PSQL \"SELECT rental_id FROM rentals INNER JOIN customers USING (customer_id) WHERE phone = '\$PHONE_NUMBER' AND bike_id = \$BIKE_ID_TO_RETURN AND date_returned IS NULL;\")\n\1\n\1\2/" bike-shop.sh
sed -ri "124s/(\s+)(#.*)/\1if [[ -z \$RENTAL_ID ]]; then\n\1  \2\n\1  \n\1fi/" bike-shop.sh
sed -ri "126s/(\s+)/\1MAIN_MENU \"You do not have that bike rented.\"\n\1/" bike-shop.sh
# logic for bike return
sed -ri "127s/(\s+)/\ \ \ \ \ \ \ \ else\n\1echo \"Rental ID \$RENTAL_ID found\"\n\1/" bike-shop.sh
./bike-shop.sh
sed -i '128d' bike-shop.sh
sed -ri '128s/(\s+)/\1# update date_returned\n\1# set bike availability to true\n\1# send to main menu\n\1/' bike-shop.sh
# update date returned
sed -ri '129s/(\s+)(#.*)/\1RETURN_BIKE_RESULT=\$(\$PSQL \"UPDATE rentals SET date_returned = NOW() WHERE rental_id = \$RENTAL_ID ;\")\n\1\2\n\1/' bike-shop.sh
# set bike availability to true
sed -ri '131s/(\s+)/\1SET_TO_TRUE_RESULT=\$(\$PSQL \"UPDATE bikes SET available = true WHERE bike_id = \$BIKE_ID_TO_RETURN;\")/' bike-shop.sh
# send to main menu
sed -ri '133s/(\s+)/\1MAIN_MENU \"Thank you for returning your bike.\"/' bike-shop.sh
./bike-shop.sh
$PSQL "SELECT * FROM rentals;"
$PSQL "SELECT * FROM bikes ORDER BY bike_id;"
./bike-shop.sh



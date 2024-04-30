# Relational Database

- [Relational Database](#relational-database)
  - [Courses](#courses)
    - [1: learn bash by building a boilerplate](#1-learn-bash-by-building-a-boilerplate)
    - [2: learn relational databases by building a mario database](#2-learn-relational-databases-by-building-a-mario-database)
    - [3: celestial bodies database](#3-celestial-bodies-database)
    - [4: learn bash scripting by building five programs](#4-learn-bash-scripting-by-building-five-programs)
    - [5: build a student database pt 1](#5-build-a-student-database-pt-1)
    - [6: build a student database pt 2](#6-build-a-student-database-pt-2)
    - [7: build a world cup database](#7-build-a-world-cup-database)
    - [8: build a kitty ipsum translator](#8-build-a-kitty-ipsum-translator)
    - [9: build a bike rental shop](#9-build-a-bike-rental-shop)
    - [10: build a salon appointment scheduler](#10-build-a-salon-appointment-scheduler)
    - [11: build a castle](#11-build-a-castle)
    - [12: build an sql reference object](#12-build-an-sql-reference-object)

## Courses
### 1: learn bash by building a boilerplate
learn terminal commands by creating a website boilerplate using only the command line.
<hr/>

### 2: learn relational databases by building a mario database
learn the basics of a relational database by creating a postgresql database filled with video game characters.
<hr/>

### 3: celestial bodies database
build a database of celestial bodies using postgresql.

#|name|description
:-:|:-:|:--
1|[universe](./03_universe/universe.sql)|a postgresql database. has tables galaxy, star, planet, and moon.
<hr/>

### 4: learn bash scripting by building five programs
learn more terminal commands and how to use them within bash scripts by creating five small programs.

#|name|description
:-:|:-:|:--
1|[questionaire.sh](./04_bash_five_programs/questionaire.sh)|question and answer type program
2|[countdown.sh](./04_bash_five_programs/countdown.sh)|program that counts down to zero from a given argument
3|[bingo.sh](./04_bash_five_programs/bingo.sh)|bingo number generator
4|[fortune.sh](./04_bash_five_programs/fortune.sh)|program to tell a persons fortune
5|[five.sh](./04_bash_five_programs/five.sh)|program to run other programs
<hr/>

### 5: build a student database pt 1
create a bash script that uses sql to enter information about computer science students into postgresql

#|name|description
:-:|:-:|:--
1|[students.csv](./05_student_database_pt1/students.csv)|students data
2|[courses.csv](./05_student_database_pt1/courses.csv)|major and courses data
3|[insert_data.sh](./05_student_database_pt1/insert_data.sh)|script to insert data from courses.csv and students.csv into students database
4|[students.sql](./05_student_database_pt1/students.sql)|student database dump file

bash keywords
- `IFS` - internal field separator 

sql keywords
- `truncate`
- `pg_dump`

<hr/>

### 6: build a student database pt 2
complete student database while diving deeper into sql commands

#|name|description
:-:|:-:|:--
1|[student_info.sh](./06_student_database_pt2/student_info.sh)|info about my computer science students from students database

sql keywords
- `where`
  - operators (`<`, `>`, `<=`, `>=`, `=`, `!=`)
  - conditional (`and`, `or`)
  - patterns (`like`, `not like`, `ilike`, `%`, `_`)
  - null (`is null`, `is not null`)
- `order by`
- `limit`
- mathematic functions (`min`, `max`, `sum`, `avg`, `ceil`, `floor`, `round`, `count`)
- other function (`distinct`)
- `group by`, `having`
- `as`
- `join`s, `using`

<hr/>

### 7: build a world cup database
create a bash script that enters information from world cup games into postgresql, then query the database for useful statistics

#|name|description
:-:|:-:|:--
1|[games.csv](./07_world_cup_database/games.csv)|games data
2|[insert_data.sh](./07_world_cup_database/insert_data.sh)|read the games data and insert to the tables
3|[queries.sh](./07_world_cup_database/queries.sh)|database queris
4|[expected_output.txt](./07_world_cup_database/expected_output.txt)|expected output from database queries
5|[worldcup.sql](./07_world_cup_database/worldcup.sql)|dump of worldcup database

<hr/>

### 8: build a kitty ipsum translator
learn some more complex commands, and the detials of how commands work

#|name|description
:-:|:-:|:--
1|[kitty_ipsum_1.txt](./08_kitty_ipsum_translator/kitty_ipsum_1.txt)|input file 1
2|[kitty_ipsum_2.txt](./08_kitty_ipsum_translator/kitty_ipsum_2.txt)|input file 2
3|[kitty_info.txt](./08_kitty_ipsum_translator/kitty_info.txt)|information about the input files
4|[translate.sh](./08_kitty_ipsum_translator/translate.sh)|script to translate some words from input files
5|[doggy_ipsum_1.txt](./08_kitty_ipsum_translator/doggy_ipsum_1.txt)|output file 1
6|[doggy_ipsum_2.txt](./08_kitty_ipsum_translator/doggy_ipsum_2.txt)|output file 2

bash keywords
- redirect
  - `>` write to file
  - `>>` append to file
  - `<` as input
  - `|` pipe
  - `1>` stdout
  - `2>` stderr
- `wc`
  - options
    - `-l` lines
    - `-w` words
    - `-m` characters
- `grep`
  - options
    - `--color` highlight searched words
    - `-c` count matching lines
    - `-o` only print matched parts of a matching line
    - `-n` prefix each line of output with line number 
    - `-E` regex matcher
- `sed`
  - flag
    - `i` ignore case
    - `g` global, all instances of matched pattern
  - options
    - `-E` regex matcher 
- `diff`
  - options
    - `--color` differentiate color from which file

<hr/>

### 9: build a bike rental shop
build an interactive bash program that stores rental information for your bike rental shop using postgresql

#|name|description
:-:|:-:|:--
1|[bike-shop.sh](./09_bike_rental_shop/bike-shop.sh)|bike rental bash program

bash keywords
- `case`

<hr/>

### 10: build a salon appointment scheduler
create an interactive bash program that uses postgresql to track the customers and appointments for your salon

#|name|description
:-:|:-:|:--
1|[examples.txt](./10_salon_appointment_scheduler/examples.txt)|sample output of the script
2|[salon.sh](./10_salon_appointment_scheduler/salon.sh)|script for salon appointment scheduler
3|[salon.sql](./10_salon_appointment_scheduler/salon.sql)|salon database dump file

<hr/>

### 11: build a castle
learn how to edit files in the terminal with nano while building a castle

#|name|description
:-:|:-:|:--
1|[castle.sh](./11_build_a_castle/castle.sh)|display a castle script

<hr/>

### 12: build an sql reference object
learn how git keeps track of your code by creating an object containing commonly used sql commands

#|name|description
:-:|:-:|:--
|[](./)|

<hr/>

<!--

### 


#|name|description
:-:|:-:|:--
|[](./)|

<hr/>
-->


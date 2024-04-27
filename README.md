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
- IFS - internal field separator 

sql keywords
- truncate
- pg_dump

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

<!--

###


#|name|description
:-:|:-:|:--
|[](./)|

<hr/>
-->


#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo "$($PSQL "DROP DATABASE worldcup") worldcup"

if [[ -a create.sql ]]; then
  rm create.sql
else
  touch create.sql
fi

echo "CREATE DATABASE worldcup"
echo "CREATE DATABASE worldcup;" >> create.sql
echo "" >> create.sql
echo "\connect worldcup;" >> create.sql
echo "" >> create.sql
echo "CREATE TABLE teams"
echo "CREATE TABLE teams(" >> create.sql
echo "  team_id SERIAL PRIMARY KEY NOT NULL," >> create.sql
echo "  name VARCHAR(50) UNIQUE NOT NULL" >> create.sql
echo ");" >> create.sql
echo "" >> create.sql
echo "CREATE TABLE games"
echo "CREATE TABLE games(" >> create.sql
echo "  game_id SERIAL PRIMARY KEY NOT NULL," >> create.sql
echo "  year INT NOT NULL," >> create.sql
echo "  "round" VARCHAR(50) NOT NULL," >> create.sql
echo "  winner_id INT NOT NULL REFERENCES teams (team_id)," >> create.sql
echo "  opponent_id INT NOT NULL REFERENCES teams (team_id)," >> create.sql
echo "  winner_goals INT NOT NULL," >> create.sql
echo "  opponent_goals INT NOT NULL" >> create.sql
echo ");" >> create.sql

psql --username=freecodecamp --dbname=postgres -f create.sql


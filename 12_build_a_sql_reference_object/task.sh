#!/bin/bash
mkdir sql_reference
cd sql_reference/
git init
ls -a
git status
git checkout -b main
touch README.md
echo SQL Reference >> README.md 
git add README.md 
touch sql_reference.json
git add sql_reference.json 
git commit -m "Initial commit"
git log
echo -e '{\n  "database": {\n    "create": "CREATE DATABASE database_name;"\n  }\n}' >> sql_reference.json 
git diff
git add sql_reference.json 
git commit -m "feat: add create database reference"
sed -ri '3s/(\s+)(.*)/\1\2,\n\1"drop": "DROP DATABASE database_name;"/' sql_reference.json 
git add sql_reference.json 
git commit -m "feat: add drop database reference"
git branch
git branch feat/add-create-table-reference
git branch # check if new branch is added
git checkout feat/add-create-table-reference 
git branch # verify if branch is swithced
sed -ri '5s/(\s+)(.*)/\1\2,\n\1"table": {\n\1\1"create": "CREATE TABLE table_name;"\n\1}/' sql_reference.json 
git add sql_reference.json 
git commit -m "feat: add create table reference"
git log --oneline
git checkout main
git merge feat/add-create-table-reference 
git branch -d feat/add-create-table-reference 
git branch # check if branch is deleted
git checkout -b feat/add-drop-table-reference
sed -ri '7s/(\s+)(.*)/\1\2,\n\1"drop": "DROP TABLE table_name;"/' sql_reference.json 
git add sql_reference.json 
git commit -m "feat: add drop table reference"
git checkout main
git merge feat/add-drop-table-reference 
git branch -d feat/add-drop-table-reference 
git checkout -b feat/add-column-references
sed -ri '9s/(\s+)(.*)/\1\2,\n\1"column": {\n\1\1"add": "ALTER TABLE table_name ADD COLUMN column_name;"\n\1}/' sql_reference.json 
git add . # sql_reference.json
git commit -m "feat: add column reference"
git checkout -b fix/create-table-syntax


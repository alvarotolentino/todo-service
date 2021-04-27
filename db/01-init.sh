#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';
  CREATE DATABASE $APP_DB_NAME;
  GRANT ALL PRIVILEGES ON DATABASE $APP_DB_NAME TO $APP_DB_USER;
  \connect $APP_DB_NAME $APP_DB_USER
  BEGIN;  
    drop table if exists todo_item;
    drop table if exists todo_list;


    create table todo_list (
      id serial primary key,
      title varchar(150)
    );

    create table todo_item(
      id serial primary key,
      title varchar(150) not null,
      checked boolean not null default false,
      list_id integer not null,
      foreign key(list_id) references todo_list(id)
    );

    insert into todo_list (title) values ('List 1'), ('List 2');
    insert into todo_item (title, list_id) values ('Item 1', 1), ('Item 2', 1), ('Item 1', 2);
  COMMIT;
EOSQL
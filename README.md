# Chinook database SQL practice exercises

This repository contains a series of SQL exercises to practice querying the Chinook database. The Chinook database represents a digital media store, including tables for artists, albums, media tracks, invoices and customers.

## Setup
### 1. Init and run the database on docker container
```bash
docker compose up -d
```
### 2. Populate the database
With the `user_name` and `db_name` defined on the `docker-compose.yaml` file, run the following command to populate the database with the Chinook schema and data:

```bash
docker exec -i postgres_container psql -U user_name -d db_name < 2.chinook_pg_serial_pk_proper_naming.sql
```

This will create the Chinook database and populate it with data.

### 3. Connect to the database
To connect to the database, run the following command:

```bash
docker exec -it postgres_container psql -U user_name -d db_name
```

### 4. Run the exercises
You can run the exercises by copying the SQL queries from the `exercise<exercise_number>.sql` file and pasting them into the terminal. Or you can run the queries from the file directly by running the following command:

```bash
docker exec -i postgres_container psql -U user_name -d db_name < exercise<exercise_number>.sql
```
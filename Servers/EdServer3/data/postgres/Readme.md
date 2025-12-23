

## Create a db and a password

```sql
CREATE DATABASE fs_ed;
CREATE USER fs_dba WITH ENCRYPTED PASSWORD 'zIU1omAaGl7JUIaZEPXxI5uRHBGc2BoY';
GRANT ALL PRIVILEGES ON DATABASE fs_ed TO fs_dba;

GRANT ALL PRIVILEGES ON SCHEMA public TO fs_dba;

edhunter fs páss: HFjmvIUp6fcFc0KyGMi0BBd4ekUN6FT8
```

## List databases and users

```sql
\l
\du
```


## Fix permission denied for schema public

In PostgreSQL 15 and later, the default permissions for the `public` schema have changed. You must explicitly grant permissions to the user after connecting to the database:

```sql
\c n8n
GRANT ALL ON SCHEMA public TO n8n_dba;
```

## PostgreSQL Command Line Interface (CLI) Commands

# Connect to a database
psql -U fs_dba -d fs_ed

# Export a database to a file (Backup)
pg_dump -U fs_dba fs_ed > backup.sql

# Import a database from a file (Restore)
psql -U fs_dba fs_ed < backup.sql

# Backup all databases in the cluster
pg_dumpall -U postgres > all_databases_backup.sql

# Create a new database
createdb -U postgres new_database_name

# Delete a database
dropdb -U postgres database_to_remove

# Create a new user/role
createuser -U postgres --interactive

# Delete a user/role
dropuser -U postgres username

# Start/Stop/Restart the PostgreSQL server
pg_ctl -D /var/lib/postgres/data start
pg_ctl -D /var/lib/postgres/data stop
pg_ctl -D /var/lib/postgres/data restart



# Connect to a different database
\c database_name

# Toggle tuples-only output (useful for scripts)
\t

# List all tables in the current database
\dt

# Describe a specific table
\d table_name

# List all schemas
\dn

# Toggle expanded display (useful for wide rows)
\x

# Enable/disable query timing
\timing

# Show help for psql commands
\?

# Quit psql
\q


## Delete all objects in a database

To quickly delete all tables, views, and types in the `public` schema:

```sql
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO public;
GRANT ALL ON SCHEMA public TO fs_dba;
```

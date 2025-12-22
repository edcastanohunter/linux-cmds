

## Create a db and a password

```sql
CREATE DATABASE fs_ed;
CREATE USER fs_dba WITH ENCRYPTED PASSWORD 'zIU1omAaGl7JUIaZEPXxI5uRHBGc2BoY';
GRANT ALL PRIVILEGES ON DATABASE fs_ed TO fs_dba;

HFjmvIUp6fcFc0KyGMi0BBd4ekUN6FT8
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


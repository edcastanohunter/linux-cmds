

## Create a db and a password

```sql
CREATE DATABASE n8n;
CREATE USER n8n_dba WITH ENCRYPTED PASSWORD 'my_password';
GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n_dba;
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


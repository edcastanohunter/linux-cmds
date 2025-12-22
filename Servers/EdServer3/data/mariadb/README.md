## 

### Categorized MariaDB and Terminal Commands

Here are some of the most useful MariaDB and related terminal commands, organized by category:

---

#### **MariaDB Server Access**

- **Login to MariaDB**
    ```bash
    mysql -u [username] -p
    ```
- **Exit MariaDB**
    ```sql
    EXIT;
    ```

---

#### **Database Management**

- **Show Databases**
    ```sql
    SHOW DATABASES;
    ```
- **Create a Database**
    ```sql
    CREATE DATABASE [database_name];
    ```
- **Drop a Database**
    ```sql
    DROP DATABASE [database_name];
    ```
- **Use a Database**
    ```sql
    USE [database_name];
    ```
- **Show Current Database**
    ```sql
    SELECT DATABASE();
    ```

---

#### **Table Management**

- **Show Tables**
    ```sql
    SHOW TABLES;
    ```
- **Create a Table**
    ```sql
    CREATE TABLE [table_name] (
        column1 datatype,
        column2 datatype,
        ...
    );
    ```
- **Describe a Table**
    ```sql
    DESCRIBE [table_name];
    ```
- **Drop a Table**
    ```sql
    DROP TABLE [table_name];
    ```
- **Optimize a Table**
    ```sql
    OPTIMIZE TABLE [table_name];
    ```
- **Repair a Table**
    ```sql
    REPAIR TABLE [table_name];
    ```
- **Check Table Status**
    ```sql
    SHOW TABLE STATUS;
    ```

---

#### **Data Manipulation**

- **Insert Data into a Table**
    ```sql
    INSERT INTO [table_name] (column1, column2, ...)
    VALUES (value1, value2, ...);
    ```
- **Select Data from a Table**
    ```sql
    SELECT * FROM [table_name];
    ```
- **Update Data in a Table**
    ```sql
    UPDATE [table_name]
    SET column1 = value1
    WHERE condition;
    ```
- **Delete Data from a Table**
    ```sql
    DELETE FROM [table_name]
    WHERE condition;
    ```

---

#### **User and Privilege Management**

- **Show Users**
    ```sql
    SELECT User, Host FROM mysql.user;
    ```
- **Create a User**
    ```sql
    CREATE USER '[username]'@'[host]' IDENTIFIED BY '[password]';
    ```
- **Delete a User**
    ```sql
    DROP USER '[username]'@'[host]';
    ```
- **Grant Privileges**
    ```sql
    GRANT ALL PRIVILEGES ON [database_name].* TO '[username]'@'[host]' IDENTIFIED BY '[password]';
    ```
- **Revoke Privileges**
    ```sql
    REVOKE ALL PRIVILEGES ON [database_name].* FROM '[username]'@'[host]';
    ```
- **Flush Privileges**
    ```sql
    FLUSH PRIVILEGES;
    ```
- **Show Current User**
    ```sql
    SELECT USER();
    ```

---

#### **Server Information and Maintenance**

- **Check MariaDB Version**
    ```sql
    SELECT VERSION();
    ```
- **Show Process List**
    ```sql
    SHOW PROCESSLIST;
    ```
- **Kill a Process**
    ```sql
    KILL [process_id];
    ```

---

#### **Backup and Restore**

- **Backup a Database**
    ```bash
    mysqldump -u [username] -p [database_name] > backup.sql
    ```
- **Restore a Database**
    ```bash
    mysql -u [username] -p [database_name] < backup.sql
    ```

---

#### **Useful Terminal Commands**

- **Clear the Terminal**
    ```bash
    clear
    ```
- **List Files in Directory**
    ```bash
    ls -l
    ```
- **Check Current Directory**
    ```bash
    pwd
    ```

---



#### **Create Database and Add User with All Privileges**

- **Create a Database**
    ```sql
    CREATE DATABASE [database_name];
    create database fs_ed
    ```

- **Create a User**
    ```sql
    CREATE USER '[username]'@'[host]' IDENTIFIED BY '[password]';

    CREATE USER 'fs_dba'@'localhost' IDENTIFIED BY '9kIPknyjT2DdPcmo3AXcpBGhkgAqBPQz';

    - **Update a User's Password**
        ```sql
        ALTER USER '[username]'@'[host]' IDENTIFIED BY '[new_password]';

        ALTER USER 'fs_dba'@'localhost' IDENTIFIED BY 'IQkiCg+ZCQz4znLRvYjYQn0c1HqclIqh';

        # Admin fs : HFjmvIUp6fcFc0KyGMi0BBd4ekUN6FT8
        ```
    ```

- **Grant All Privileges on the Database to the User**
    ```sql
    GRANT ALL PRIVILEGES ON [database_name].* TO '[username]'@'[host]';

    GRANT ALL PRIVILEGES ON fs_ed.* TO 'fs_dba'@'localhost';
    ```

<!--
    The `FLUSH PRIVILEGES;` SQL command is used to reload the grant tables in MariaDB or MySQL.
    This ensures that any changes made to user privileges (such as adding, modifying, or removing users or permissions)
    take effect immediately without needing to restart the database server.
-->
- **Flush Privileges**
    ```sql
    FLUSH PRIVILEGES;
    ```


    #### **Generate a Secure Password via SSH**

    - **Generate a Secure Random Password**
        - **Alternative: Generate a Secure Password using `pwgen`**
            ```bash
            pwgen -s 20 1
            ```
        ```bash
        openssl rand -base64 20
        ```
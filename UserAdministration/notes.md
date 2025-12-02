## Linux User and Groups administration commands

    sudo useradd -m -s /bin/bash newuser
    ```
    This command creates a new user named `newuser`, creates their home directory (`-m`), and sets their default shell to `/bin/bash` (`-s`).

*   **`passwd`**: Set or change a user's password.
    ```bash
    sudo passwd newuser
    ```
    After running this, you will be prompted to enter and confirm the new password for `newuser`.

*   **`usermod`**: Modify an existing user account.
    ```bash
    sudo usermod -aG sudo newuser
    ```
    This command adds `newuser` to the `sudo` group (`-aG`), granting them administrative privileges.

*   **`userdel`**: Delete a user account.
    ```bash
    sudo userdel -r olduser
    ```
    This command deletes the user `olduser` and removes their home directory and mail spool (`-r`).

*   **`id`**: Display user and group information for a specified user or the current user.
    ```bash
    id newuser
    ```
    This shows the User ID (UID), Group ID (GID), and all groups `newuser` belongs to.

*   **`groups`**: Print the names of the primary and supplementary groups for each given username, or for the current process if none is given.
    ```bash
    groups newuser
    ```
    This lists all groups that `newuser` is a member of.

cat /etc/passwd | cut -d: -f1


### Group Management

*   **`groupadd`**: Create a new group.
    ```bash
    sudo groupadd developers
    ```
    This command creates a new group named `developers`.

*   **`groupmod`**: Modify an existing group.
    ```bash
    sudo groupmod -n devteam developers
    ```
    This command renames the group `developers` to `devteam` (`-n`).

*   **`groupdel`**: Delete a group.
    ```bash
    sudo groupdel oldgroup
    

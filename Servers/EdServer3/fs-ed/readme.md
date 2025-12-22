

```bash
docker network create fs_network
```

```bash
# Recommended script to ensure the relative folder exists before using it as a Docker volume
RELATIVE_FOLDER="./data"

# Create the folder if it does not exist
mkdir -p "$RELATIVE_FOLDER"

# Set appropriate permissions (e.g., read/write for owner and group)
chmod 770 "$RELATIVE_FOLDER"

<!-- 
This command recursively changes the ownership of the directory `./n8n_storage` and all its contents to the user and group with the ID 1000. 
It is typically used to ensure that a specific user (often the default user in many Linux systems) has the necessary permissions to read, write, and execute files within this directory, which is important for applications that require access to persistent storage.
-->
sudo chown -R 1000:1000 ./facturascripts_data
sudo chown -R 1000:1000 ./n8n-files
```

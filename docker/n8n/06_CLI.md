# n8n CLI Commands

The n8n Command Line Interface (CLI) provides powerful tools for managing your n8n instance, backing up data, and executing workflows directly from the terminal.

## 1. Export Workflows
Export all your workflows to JSON files. This is essential for backups and version control.

**Command:**
```bash
n8n export:workflow --all --output=backups/workflows.json
```

**Options:**
- `--all`: Export all workflows.
- `--output`: Specify the output file or directory.
- `--backup`: (Optional) Export each workflow to a separate file in the specified directory.

**Example:**
```bash
# Export separate files for each workflow to the 'git-backup' folder
n8n export:workflow --backup --output=./git-backup/
```

## 2. Export Credentials
Export your credentials. **Important:** By default, credentials are encrypted with your instance's encryption key. Use `--decrypted` to export them in plain text for migration to a new instance.

**Command:**
```bash
n8n export:credentials --all --decrypted --output=backups/credentials.json
```

**Explanation:**
Use the `--decrypted` flag if you plan to import these credentials into a different n8n installation. If you are just backing up for the same instance, you can omit it.

## 3. Import Workflows
Import workflows from a JSON file.

**Command:**
```bash
n8n import:workflow --input=backups/workflows.json
```

## 4. Import Credentials
Import credentials from a JSON file.

**Command:**
```bash
n8n import:credentials --input=backups/credentials.json
```

## 5. Execute Workflow
Run a specific workflow directly from the CLI. Useful for testing or scheduled cron jobs outside of n8n.

**Command:**
```bash
n8n execute --id=YOUR_WORKFLOW_ID
```

## 6. Reset User Management (Emergency)
If you are locked out of your self-hosted instance, this command resets the user management system, allowing you to create a new owner account. **Note:** This does not delete your workflows or credentials.

**Command:**
```bash
n8n user-management:reset
```

## 7. List Workflows
List all workflows in your n8n instance.

**Command:**
```bash
n8n list:workflow
```

----

## Docker 

```
docker run -it -p 5678:5678 --name n8n n8nio/n8n
```

### Copy Files from Container to Host
To extract files from a running (or stopped) Docker container to your local machine.

**Command:**
```bash
docker cp <container_id_or_name>:<path_inside_container> <path_on_host>
```

**Example:**
```bash
# Copy the .n8n directory from the 'n8n' container to the current directory
docker cp n8n:/home/node/.n8n ./n8n-backup
```

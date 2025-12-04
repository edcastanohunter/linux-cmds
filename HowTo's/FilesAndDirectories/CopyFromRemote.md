
Use the -r flag to copy directories recursively.

```powershell
scp -r <username>@<remote_host>:<remote_directory_path> <local_destination_path>
```
Example
If you want to copy the folder /var/www/html from a server at 192.168.1.50 to your local C:\Backups folder:

```bash
scp -r user@192.168.1.50:/var/www/html C:\Backups
```

Alternative: rsync (If using Git Bash / WSL)
If you are using Git Bash or WSL, rsync is often better because it shows progress and can resume interrupted transfers.

```bash
rsync -avz <username>@<remote_host>:<remote_directory_path> <local_destination_path>

rsync -avz edhunter@:edcastdev.com:/etc/nginx /mnt/c/_WS/personal/linux-cmds/EdCastDev/nginx/


```
Would you like me to add this to your HOwTos directory in a new file (e.g., CopyFilesOverSSH.md) for future reference?



```bash
sudo ss -tuln | grep 5001
# or
sudo netstat -tuln | grep 5001
```

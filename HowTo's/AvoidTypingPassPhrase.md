

## Adding your SSH Keys to an SSH Agent to Avoid Typing the Passphrase

```bash
# start the SSH Agent
eval $(ssh-agent)

# add your SSH key to the agent
ssh-add ~/.ssh/id_rsa



# /etc/ssh/sshd_config 
sudo groupadd -r sshmembers

sudo usermod -a -G sshmembers user1
sudo usermod -a -G sshmembers user2


sudo service ssh restart
```
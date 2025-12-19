```bash
docker network create n8n_network

# Add containeers to the network
docker network connect n8n_network global_postgres
docker network connect n8n_network global_redis

#To see which containers are connected to the network
docker network inspect n8n_network

# To test connectivity and DNS resolution, you can run a temporary container on the new network and try to ping the original container by its name:
 docker run -it --rm --network n8n_network busybox sh
# Inside the new container, run:
ping global_postgres
ping global_redis
#

docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"
# alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"'
# alias dpss='docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'
# https://dev.to/silentwatcher_95/securing-redis-with-acls-and-integrating-redis-insight-in-docker-59c1

# Generate a random password
openssl rand -base64 24
```


## https://docs.n8n.io/hosting/configuration/task-runners/#external-mode
## https://docs.n8n.io/hosting/configuration/task-runners/

# N8N

## Workflows de ejemplo
- https://n8n.io/workflows/

## Herramientas
- https://k3d.io/stable/usage/commands/k3d_cluster_start/#see-also

## Repos de ejemplos 
- Hostear N8N https://github.com/n8n-io/n8n-hosting 

## Docker Commands
```bash
# to delete the also the volumes in the composition
docker compose down -v

# to create the volumes
docker volume create n8n_postgres_data
docker volume create n8n_postgres_data
docker volume create n8n_redis_data
docker volume create n8n_data
docker volume create n8n_custom_nodes
docker volume create n8n_workflows

# to create the networks
docker network create n8n_network
docker network create global_db_management_network

# to inspect the container
docker inspect n8n_postgres --format "{{range .NetworkSettings.Networks}}{{.NetworkID}} {{.IPAddress}} {{end}}"


docker cp -r n8n:/home/node/backups ./


sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

an example alias for batcat as bat:

alias bat="batcat"

```


# Initialize a swarm on the current node
docker swarm init

# Generate a join token for worker nodes
docker swarm join-token worker

# List all nodes in the swarm and their status
docker node ls

# Deploy or update a stack from a compose file
docker stack deploy -c docker-compose.yml <stack_name>

# List all active stacks
docker stack ls

# List all services across the swarm
docker service ls

# List the tasks (containers) of a specific service
docker service ps <service_name>

# Scale a service to a specific number of replicas
docker service scale <service_name>=<replicas>

# View logs for a specific service
docker service logs -f <service_name>

# Remove a stack and all its services
docker stack rm <stack_name>

# Force a node to leave the swarm
docker swarm leave --force

```yml
restart_policy:
  condition: <none | on-failure | any>
  delay: 5s
  max_attempts: 3
  window: 120
```
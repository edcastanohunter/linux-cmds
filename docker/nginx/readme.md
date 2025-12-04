## Summary

This project will start up nginx within a docker container running in host mode, listening on port 80 and 443.

An example block is configured for an application listening on port 80.  This can be tested using a CloudFlare Tunnel. 


## Common Commands

Hot reload nginx after changes to configuration

```bash
/usr/bin/docker exec -it nginx nginx -s reload
```

To tail the logs:

```bash
tail -10 /home/thomas/docker/nginx/data/nginx/logs/access.log
```

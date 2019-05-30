dnscrypt docker compose/stack.

### compose

```bash
docker-compose up -d
```

### stack
```bash
docker stack deploy -c ./docker-stack.yml dnscrypt
```

Change You first dns server to 127.0.0.1 and enjoy.

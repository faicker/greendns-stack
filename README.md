dnscrypt docker compose/stack.

### compose

* customize listen in .env file.
* supported on Linux/Windows/MacOS.

```bash
docker-compose up -d
```

### stack

supported on Linux(because of host mode network)

```bash
docker stack deploy -c ./docker-stack.yml dnscrypt
```

Change You first dns server to 127.0.0.1 and enjoy.

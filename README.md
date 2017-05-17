pydio docker image
==================

## Getting started

```sh
docker run -d --name="pydio" -p 8080:80 \
  -v /path/to/www:/var/www/html \
  hydranewmedia/pydio
```

## Example `docker-compose`

```yaml
version: '3'
services:
  pydio:
    image: hydranewmedia/paydio:8
    volumes:
      - './.data/:/var/www/html'
    depends_on:
      - db
    networks:
      - main
  db:
    image: mariadb:latest
    environment:
      - 'MYSQL_ROOT_PASSWORD=test'
      - 'MYSQL_DATABASE=pydio'
    networks:
      - main
networks:
  main:
```

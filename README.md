pydio docker image
==================

## Getting started

```sh
docker run -d --name="pydio" -p 8080:80 \
  -v /path/to/www:/var/www/html \
  hydranewmedia/pydio
```

This command will get you a out of the box working pydio instance to try out.
A reverse proxy with https and separate database is recommended for a production setup.

## Upgrades

The image will copy pydio to `/var/www/html` on startup **only** if that directory does not already contain pydio.
You can use the internal pydio upgrade mechanism (a backup is highly recommended before that!)

## Example `docker-compose`

```yaml
version: '3'
services:
  pydio:
    image: hydranewmedia/pydio:8
    volumes:
      - '/path/to/html:/var/www/html'
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

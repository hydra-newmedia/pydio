#!/bin/bash
set -euo pipefail

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then
  if ! [ -e index.php -a -e conf/VERSION ]; then
    echo >&2 "Pydio not found in $PWD - copying now..."
  if [ "$(ls -A)" ]; then
    echo >&2 "WARNING: $PWD is not empty - press Ctrl+C now if this is an error!"
    ( set -x; ls -A; sleep 10 )
  fi
  tar cf - --one-file-system -C /usr/src/pydio . | tar xf -
  echo >&2 "Complete! Pydio has been successfully copied to $PWD"
  sed -i '/en_EN.UTF-8/s/^\/\///g' ./conf/bootstrap_conf.php
  chown -R www-data:www-data /var/www/html/
  chmod -R 775 /var/www/html
  fi
fi

exec "$@"

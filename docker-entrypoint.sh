#!/bin/sh

set -e

if [ -n "${KUBERNETES_SERVICE_HOST}" ]; then

  DB_NAME=$(vault-env env | grep DB_NAME | cut -d"=" -f2)
  DB_USER=$(vault-env env | grep DB_USER | cut -d"=" -f2)
  DB_PASSWORD=$(vault-env env | grep DB_PASSWORD | cut -d"=" -f2)

cat << EOF > /home/mintel/.my.cnf
[client]

database=$DB_NAME
user=$DB_USER
password=$DB_PASSWORD
host=127.0.0.1
EOF
    
fi

exec "$@"

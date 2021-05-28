#!/bin/sh
set -e -o nounset

# Default settings (else take from env)
DB_HOST=${DB_HOST:-127.0.0.1}
DB_CONF=${DB_CONF:-$HOME/.my.cnf}
KUBERNETES_SERVICE_HOST=${KUBERNETES_SERVICE_HOST:-}

cat << EOF > "$DB_CONF"
[client]

database=$DB_NAME
user=$DB_USER
password=$DB_PASSWORD
host=$DB_HOST
EOF
    
exec "$@"

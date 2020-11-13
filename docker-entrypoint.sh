#!/bin/sh
set -e -o nounset

# Default settings (else take from env)
DB_HOST=${DB_HOST:-127.0.0.1}
DB_CONF=${DB_CONF:-$HOME/.my.cnf}
VAULT_ENABLED=${VAULT_ENABLED:-false}
KUBERNETES_SERVICE_HOST=${KUBERNETES_SERVICE_HOST:-}

# Grab db-values from vault if vault is enabled and we are running
# inside kubernetes.
if [ -n "${KUBERNETES_SERVICE_HOST}" ] && [ "${VAULT_ENABLED}" = "true" ]; then
  DB_NAME=$(vault-env env | grep DB_NAME | cut -d"=" -f2)
  DB_USER=$(vault-env env | grep DB_USER | cut -d"=" -f2)
  DB_PASSWORD=$(vault-env env | grep DB_PASSWORD | cut -d"=" -f2)
fi

cat << EOF > "$DB_CONF"
[client]

database=$DB_NAME
user=$DB_USER
password=$DB_PASSWORD
host=$DB_HOST
EOF
    
exec "$@"

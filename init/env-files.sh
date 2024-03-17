#!/bin/bash

SECRETS_FOLDER=secrets
REALM_SECRET=Z3UIkhnpy7fXPKnrhjkrUov1379wUgTU

if [ -d "$SECRETS_FOLDER" ]; then rm -Rf $SECRETS_FOLDER; fi

count=$(docker network ls | grep monitoring | wc -l)
if [ "$count" -eq 0 ]; then docker network create monitoring; fi

mkdir -p $SECRETS_FOLDER

DATABASE_DEV_ENV=$SECRETS_FOLDER/database-dev.env
KEYCLOAK_DEV_ENV=$SECRETS_FOLDER/keycloak-dev.env
PG_EXPORTER_DEV_ENV=$SECRETS_FOLDER/pg-exporter-dev.env
GRAFANA_DEV_ENV=$SECRETS_FOLDER/grafana-dev.env

echo POSTGRES_USER=admin >> $DATABASE_DEV_ENV
echo POSTGRES_PASSWORD=admin >> $DATABASE_DEV_ENV

echo KEYCLOAK_ADMIN=admin >> $KEYCLOAK_DEV_ENV
echo KEYCLOAK_ADMIN_PASSWORD=admin >> $KEYCLOAK_DEV_ENV
echo CUSTOM_KC_REALM_SECRET=$REALM_SECRET >> $KEYCLOAK_DEV_ENV
echo KC_DB_USERNAME=admin >> $KEYCLOAK_DEV_ENV
echo KC_DB_PASSWORD=admin >> $KEYCLOAK_DEV_ENV

echo GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET=$REALM_SECRET > $GRAFANA_DEV_ENV

CONNECTION_STRING=postgresql://admin:admin@postgres_application:5432/postgres?sslmode=disable
echo DATA_SOURCE_NAME= $CONNECTION_STRING >> $PG_EXPORTER_DEV_ENV


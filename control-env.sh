#!/usr/bin/env bash
function start {
  echo "Starting up"
  docker-compose --project-name seleccion up -d
}

function stop {
  echo "Stopping and removing containers"
  docker-compose --project-name seleccion down
}

function cleanup {
  echo "Removing volume"
  docker volume rm seleccion_postgres-data
  docker volume rm seleccion_superset
}

function token {
  echo 'Your TOKEN for Jupyter Notebook is:'
  SERVER=$(docker exec -it jupyter jupyter notebook list)
  echo "${SERVER}" | grep '/notebook' | sed -E 's/^.*=([a-z0-9]+).*$/\1/'
}

function superset-init {
  echo 'Initializing Superset database using sqlite'
  docker exec -it superset superset-init
}

function superset-start {
  echo 'Starting Superset container'
  docker container start superset
}

function superset-stop {
  echo 'Stopping Superset container'
  docker container stop superset
}

function superset-import {
  echo 'trying to import /home/superset/dashboards/seleccion.json dashboard . . .'
  docker exec -it superset superset import-dashboards -p /home/superset/dashboards/seleccion.json
}

function psql {
  docker exec -it postgres psql -U seleccion seleccion
}

case $1 in
  start )
  start
    ;;

  stop )
  stop
    ;;

  cleanup )
  stop
  cleanup
    ;;

  token )
  token
    ;;

  superset-start )
  superset-start
    ;;
  
  superset-stop )
  superset-stop
    ;;

  superset-init )
  superset-init
    ;;
  superset-import )
  superset-import
    ;;

  psql )
  psql
    ;;

  * )
  printf "ERROR: Missing command\n  Usage: `basename $0` (start|stop|cleanup|token|logs|update|superset-start|superset-stop|superset-init)\n"
  exit 1
    ;;
esac

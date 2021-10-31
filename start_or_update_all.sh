#!/bin/bash -
#===============================================================================
#
#          FILE: start_or_update_all.sh
#
#         USAGE: ./start_or_update_all.sh
#
#   DESCRIPTION: docker compose start or update script
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: zhiang.peng
#  ORGANIZATION:
#       CREATED: 10/31/2021 03:45:48 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

script_path=$(readlink -f "$0")
script_dir=$(dirname ${script_path})

cmd="docker-compose"
pushd ${script_dir} > /dev/null
    if [ ! -d applications ]
    then
        echo "[no change] no applications"
        exit 0
    fi
    for config in applications/*.yml
    do
        cmd="${cmd} -f ${config}"
    done

    cmd="${cmd} up --force-recreate --build -d"
    echo ${cmd}
    $cmd
    docker image prune -f
popd > /dev/null

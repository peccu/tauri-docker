#!/bin/bash
# -*- shell-script -*-
# docker-compose.yml's path
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
COMPOSE=$SCRIPT_DIR/compose.yml
NAME=tauri
COMMAND=bash

# try exec or up and exec if failed in 10 seconds
# ignore when execed after 2 seconds
restarttime=2
launch=$(date "+%s")
wd=$(pwd)

function inShortTime(){
    local launch=$1
    local restarttime=$2
    [ $(($(date +%s) - launch)) -lt $restarttime ]
}

function de(){
    docker exec \
           -it \
           $NAME \
           $COMMAND
}

de \
    && : \
        || (\
            inShortTime $launch $restarttime \
                && docker compose -f $COMPOSE up -d \
                && de \
    )

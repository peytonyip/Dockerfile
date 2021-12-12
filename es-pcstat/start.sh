#!/bin/bash

config_file=/app/es.conf
type="console"
interval=60

if [[ -n "$1" ]]; then
    type=$1
fi

if [[ -n "$2" ]]; then
    interval=$2
fi

if [[ -n "$3" ]]; then
    config_file=$3
fi


exec ./app/es-pcstat -outputTypeFlag="$type" -collectIntervalFlag="$interval" -sortFlag=true "$config_file"

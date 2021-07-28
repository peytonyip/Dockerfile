#!/bin/sh

. ./env.sh
#exec java ${JAVA_TOOL_OPTIONS} -jar /application/app.jar ${@}
exec java -jar /application/app.jar ${@}
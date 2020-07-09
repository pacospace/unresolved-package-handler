#!/usr/bin/env sh
#
# This script is run by OpenShift's s2i. Here we guarantee that we run desired
# command and debug level
#

if [ "$SUBCOMMAND" = "producer" ]
then
    if [ "$DEBUG_LEVEL" -eq 1]
    then
        exec pipenv run faust --debug --loglevel debug -A producer main
    else
        exec pipenv run faust -A producer main
    fi
elif [ "$SUBCOMMAND" = "consumer" ]
then
    if [ "$DEBUG_LEVEL" -eq 1]
    then
        exec pipenv run faust --debug --loglevel debug -A consumer worker
    else
        exec pipenv run faust -A consumer worker
    fi
fi

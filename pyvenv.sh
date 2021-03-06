#!/bin/bash

project=$1

[ -f ${project} ] || exec python -u $2

venv=$(jq ".virtualenv" ${project})

if [ "${venv}" != 'null' ]; then
    venv=$(echo ${venv} | sed 's/"//g')

    source "${venv}/bin/activate"

    exec python -u $2
fi
exec python -u $2


#!/bin/bash

project=$1

[ -f ${project} ] || exec python -i -u $3

venv=$(jq ".virtualenv" ${project})

if [ "${venv}" != 'null' ]; then
    venv=$(echo ${venv} | sed 's/"//g')

    source "${venv}/bin/activate"

    exec python -i -u $3
fi
exec python -i -u $3


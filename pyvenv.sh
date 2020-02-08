#!/bin/bash

projectpath=$1

projectname=$2
[ -d $projectpath ] || exec python -i -u $3

projectfile=$(ls $projectpath/$projectname)
[ -f $projectfile ] || exec python -i -u $3

venv=$(jq ".virtualenv" $projectfile)

if [ "$venv" != 'null' ]; then
    venv=$(echo $venv | sed 's/"//g')

    source "${venv}/bin/activate"

    exec python -i -u $3
fi
exec python -i -u $3


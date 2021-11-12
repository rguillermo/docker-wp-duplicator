#!/usr/bin/env bash

set -eo pipefail

workdir='/var/www/html'
duplicator_package="$workdir/duplicator_package"

echo "There are $# arguments passed"

if [[ -e $duplicator_package/installer.php ]]

then

    echo "Duplicator package found."
    echo "Moving package to $workdir"
    mv $duplicator_package/* $workdir/
    echo "Executing $@"
    exec "$@"

else
    echo "$duplicator_package/installer.php does not exists"
    docker-entrypoint.sh $1

fi

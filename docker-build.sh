#!/usr/bin/env bash

echo pm-database version: ${VERSION}
echo pm-database platform: ${PLATFORM}


pushd ${PROJECT_FOLDER}/pm-database

docker build \
     --platform=$PLATFORM \
     -t plusmin/pm-database:${VERSION} .

popd
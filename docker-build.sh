#!/bin/bash

echo " info: cleaning old go files..."
rm -f defines.go dungeon.go

echo " info: making open-adventure image"
docker build -t yaml2go . || exit 2

echo " info: creating 'defines.go'..."
docker run yaml2go /bin/cat /src/defines.go > defines.go

echo " info: creating 'dungeon.go'..."
docker run yaml2go /bin/cat /src/dungeon.go > dungeon.go


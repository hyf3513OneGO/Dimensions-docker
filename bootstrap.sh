#!/bin/bash

cd /usr/src/dimensions
curl -o config.js -L $DIMENSIONS_CONFIG
node ./build/index.js

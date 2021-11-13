#!/bin/bash
dir_test=./node_modules

if [ ! -d $dir_test ]
then
  echo "NPM UPDATE!"
  npm install
fi

if [ "$NODE_ENV" == 'development' ]
then
  echo "DEV MODE ::."
    npm run dev
else
  echo "PRODUCTION MODE ::."
    npm run prod
fi
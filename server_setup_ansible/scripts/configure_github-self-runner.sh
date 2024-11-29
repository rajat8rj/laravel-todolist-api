#!/bin/bash

cd /home/vmadmin/actions-runner

# Create the runner and start the configuration experience
./config.sh --url https://github.com/rajat8rj/laravel-todolist-api --token AGDOEW4FMXR72RSEPFD3NJTHJA32C
 # Last step, run it!
./run.sh

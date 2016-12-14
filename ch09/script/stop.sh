#!/bin/bash

BASE_PATH="/usr/share/local/namu"

kill `cat $BASE_PATH/namu.pid`
rm $BASE_PATH/namu.pid



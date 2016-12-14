#!/usr/bin/env bash

BASE_PATH="/home/jins/"

DEFAULT_JVM_OPTS="-server -XX:+UnlockDiagnosticVMOptions -XX:+PrintGCDetails -XX:NumberOfGCLogFiles=10 -XX:+PrintGCTimeStamps -XX:+PrintAdaptiveSizePolicy -Xloggc:$BASE_PATH/namuGC.log -XX:GCLogFileSize=100M -XX:+UseGCLogFileRotation "

CONF_OPTS=" -Dlogback.configurationFile=$BASE_PATH/logback.xml -Dconf.home=$BASE_PATH "


PID=`cat $BASE_PATH/namu.pid 2> /dev/null`

echo "check PID file $PID"
if [ ! -x $PID ]; then
    echo "Process Namu already running. Please check namu.pid first. ps -ef | grep namu  ... or rm namu.pid"
    exit 1
else
    echo "Start namu process."
fi

if [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA=`which java`
fi

if [ ! -x "$JAVA" ]; then
    echo "Could not find any executable java binary. Please install java in your PATH or set JAVA_HOME"
    exit 1
fi

exec "$JAVA" $DEFAULT_JVM_OPTS $CONF_OPTS -jar $BASE_PATH/elsClient.jar 2> /dev/null 1>&2 &
retval=$?
pid=$!

echo $pid

echo $pid > $BASE_PATH/namu.pid

#!/bin/sh
if [ -n "$JAVA_OPTS" ]; then
  echo "JAVA_OPTS ${JAVA_OPTS}";
else
  echo "JAVA_OPTS not set";
  export JAVA_OPTS="-Xms128m -Xmx192m";
fi

if [ -n "$DEBUG_MODE" ]; then
  echo "DEBUG_MODE enable";
  export JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5080";
else
  echo "DEBUG_MODE not set";
fi

echo "All args $@"
if [ "$1" = "java" ]; then
  shift;
  echo "Run java ${JAVA_OPTS} $@"
  exec java ${JAVA_OPTS} "$@";
else
  exec "$@";
fi


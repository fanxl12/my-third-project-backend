#!/bin/sh
# Maven Wrapper startup script

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."
fi

# Resolve links - $0 may be a softlink
PRG="$0"
while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRG_DIR=`dirname "$PRG"`
MAVEN_PROJECTBASEDIR=`cd "$PRG_DIR/.." >/dev/null; pwd`

if [ -z "$MAVEN_HOME" ] || [ ! -e "$MAVEN_HOME/lib/maven-plugin-api-3.9.9.jar" ] ; then
  if [ -f "$PRG_DIR/.mvn/wrapper/maven-wrapper.jar" ] ; then
    MAVEN_HOME="$PRG_DIR/.mvn/maven_home"
    "$JAVACMD" -jar "$PRG_DIR/.mvn/wrapper/maven-wrapper.jar" "$PRG_DIR/.mvn/wrapper/maven-wrapper.properties" "$MAVEN_HOME"
  fi
fi

export MAVEN_HOME

MAVEN_OPTS="$(echo "$MAVEN_OPTS" | tr '[:upper:]' '[:lower:]')"
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CONFIG="$PRG_DIR/.mvn"

exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$MAVEN_HOME/lib/maven-plugin-api-3.9.9.jar:$MAVEN_HOME/lib/maven-model-3.9.9.jar:$MAVEN_HOME/lib/maven-core-3.9.9.jar:$MAVEN_HOME/lib/maven-embedder-3.9.9.jar" \
  "-Dmaven.home=$MAVEN_HOME" \
  "-Dmaven.multiModuleProjectDirectory=$MAVEN_PROJECTBASEDIR" \
  "-Dmaven.wrapper.properties=$PRG_DIR/.mvn/wrapper/maven-wrapper.properties" \
  org.apache.maven.wrapper.MavenWrapperMain \
  $MAVEN_CMD_LINE_ARGS

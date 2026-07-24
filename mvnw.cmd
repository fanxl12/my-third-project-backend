@echo off
setlocal enabledelayedexpansion

if not defined JAVA_HOME (
  echo ERROR: JAVA_HOME is not set, and no Java command could be found.
  exit /b 1
)

set "JAVACMD=%JAVA_HOME%\bin\java.exe"
if not exist "%JAVACMD%" (
  echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
  exit /b 1
)

set "DIRNAME=%~dp0"
set "MAVEN_PROJECTBASEDIR=%DIRNAME%.."

if not defined MAVEN_HOME if exist "%DIRNAME%.mvn\wrapper\maven-wrapper.jar" (
  set "MAVEN_HOME=%DIRNAME%.mvn\maven_home"
  "%JAVACMD%" -jar "%DIRNAME%.mvn\wrapper\maven-wrapper.jar" "%DIRNAME%.mvn\wrapper\maven-wrapper.properties" "%MAVEN_HOME%"
)

set "MAVEN_CONFIG=%DIRNAME%.mvn"
set "MAVEN_CMD_LINE_ARGS=%MAVEN_CONFIG% %*"

"%JAVACMD%" ^
  %MAVEN_OPTS% ^
  %MAVEN_DEBUG_OPTS% ^
  -classpath "%MAVEN_HOME%\lib\maven-plugin-api-3.9.9.jar;%MAVEN_HOME%\lib\maven-model-3.9.9.jar;%MAVEN_HOME%\lib\maven-core-3.9.9.jar;%MAVEN_HOME%\lib\maven-embedder-3.9.9.jar" ^
  "-Dmaven.home=%MAVEN_HOME%" ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  "-Dmaven.wrapper.properties=%DIRNAME%.mvn\wrapper\maven-wrapper.properties" ^
  org.apache.maven.wrapper.MavenWrapperMain ^
  %MAVEN_CMD_LINE_ARGS%

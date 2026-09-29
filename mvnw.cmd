@echo off
setlocal
set "BASE_DIR=%~dp0"
set "MAVEN_VERSION=3.9.11"
set "MAVEN_HOME=%BASE_DIR%.mvn\apache-maven-%MAVEN_VERSION%"
set "MAVEN_ZIP=%BASE_DIR%.mvn\apache-maven-%MAVEN_VERSION%-bin.zip"

if exist "%MAVEN_HOME%\bin\mvn.cmd" goto RUN_MAVEN

echo Maven %MAVEN_VERSION% not found. Downloading Maven...
if not exist "%BASE_DIR%.mvn" mkdir "%BASE_DIR%.mvn"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/%MAVEN_VERSION%/binaries/apache-maven-%MAVEN_VERSION%-bin.zip' -OutFile '%MAVEN_ZIP%'"

if not exist "%MAVEN_ZIP%" (
  echo Failed to download Maven. Check your internet connection.
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Expand-Archive -LiteralPath '%MAVEN_ZIP%' -DestinationPath '%BASE_DIR%.mvn' -Force"

if not exist "%MAVEN_HOME%\bin\mvn.cmd" (
  echo Maven extraction failed.
  exit /b 1
)

:RUN_MAVEN
call "%MAVEN_HOME%\bin\mvn.cmd" %*
exit /b %ERRORLEVEL%

#!/bin/sh
BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
MAVEN_VERSION=3.9.11
MAVEN_HOME="$BASE_DIR/.mvn/apache-maven-$MAVEN_VERSION"
MAVEN_ZIP="$BASE_DIR/.mvn/apache-maven-$MAVEN_VERSION-bin.tar.gz"

if [ ! -x "$MAVEN_HOME/bin/mvn" ]; then
  echo "Maven $MAVEN_VERSION not found. Downloading Maven..."
  mkdir -p "$BASE_DIR/.mvn"
  curl -fsSL "https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" -o "$MAVEN_ZIP" || exit 1
  tar -xzf "$MAVEN_ZIP" -C "$BASE_DIR/.mvn" || exit 1
fi

exec "$MAVEN_HOME/bin/mvn" "$@"

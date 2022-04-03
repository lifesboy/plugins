#!/usr/bin/bash
method=$1
PLUGINS=$2

CURDIR=$(pwd)

INSTALLEDDIR="/usr/local"
#Dev machine
#INSTALLEDDIR="/Volumes/Extra/workspace/selks-gpu/staging/usr/local"

if ! test -n "$PLUGINS"; then
  PLUGINS="security/clamav"
  PLUGINS="${PLUGINS} www/c-icap"
fi

for PLGIN in ${PLUGINS}; do
  echo "\n>>> ${PLGIN}"
  PLGIN_SRC_DIR="${CURDIR}/${PLGIN}/src"
  PLGIN_DIRS=$(find $PLGIN_SRC_DIR -type d)
  PLGIN_FILES=$(find $PLGIN_SRC_DIR -type f)

  if [ $method = "install" ] || [ $method = "all" ]; then
    for DIR in ${PLGIN_DIRS}; do
      INSTALL_DIR=$(echo $DIR | sed -r "s#$PLGIN_SRC_DIR#$INSTALLEDDIR#")
      #echo "${INSTALL_DIR}"
      mkdir -p "${INSTALL_DIR}"
      ls -la "${INSTALL_DIR}"
    done


  fi
done

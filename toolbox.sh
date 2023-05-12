#!/bin/bash

# Toolbox is a script for running openstack cloud compatible environment
# with tools and nice PS1

set -eo pipefail

print_usage() {
  printf "Usage: Just run ./toolbox.sh\n"
  printf "  -p : pull image before running it\n"
}


TOOLBOX="registry.gitlab.ics.muni.cz:443/cloud/g2/g2-toolbox"
TOOLBOX_VERSION="latest"
DOCKER_BIN=${DOCKER_BIN:-"docker"}
HOST_KRB5CONF="/etc/krb5.conf"
HOST_LOCALTIME="/etc/localtime"
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
TMP_DIR="/tmp/g2cloud-toolbox"

GUEST_HOME="/home/cloud"
GUEST_KRB5CONF=$HOST_KRB5CONF
GUEST_LOCALTIME=$HOST_LOCALTIME
GUEST_VOLUME="g2cloud-toolbox"

while getopts 'pv:h' option
do
  case "${option}" in
  p) echo "Pulling latest image" ;;
  v) TOOLBOX_VERSION="${OPTARG}" && echo "Pulling version ${TOOLBOX_VERSION} image" ;;
  h) print_usage
     exit 1 ;;
  esac
done

# pull docker image
${DOCKER_BIN} pull "$TOOLBOX":"$TOOLBOX_VERSION"  && ${DOCKER_BIN} image prune -f

# On MacOS it is not possible to bind anything in /etc
# make a copy and bind that instead
if [[ "$OSTYPE" == "darwin"* ]]; then
  mkdir -p "$TMP_DIR"

  cp "$HOST_KRB5CONF" "${TMP_DIR}/krb5.conf"
  HOST_KRB5CONF="${TMP_DIR}/krb5.conf"

  cp "$HOST_LOCALTIME" "${TMP_DIR}/localtime"
  HOST_LOCALTIME="${TMP_DIR}/localtime"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
  printf "Set SSH_AUTH_SOCK with path to ssh-agent's auth socket\n"
  exit 1
fi


if ! ${DOCKER_BIN} volume inspect "$GUEST_VOLUME" &> /dev/null; then
  ${DOCKER_BIN} volume create "$GUEST_VOLUME" 1> /dev/null
fi


${DOCKER_BIN} run -it --rm \
  --net=host \
  -e KRB5CCNAME="FILE:${GUEST_HOME}/.krb5_ticket" \
  -e SSH_AUTH_SOCK=/ssh-agent \
  -e LC_ALL=C.UTF-8 \
  -v "${SSH_AUTH_SOCK}:/ssh-agent" \
  -v "${GUEST_VOLUME}:${GUEST_HOME}/persistent/:z" \
  -v "${HOST_LOCALTIME}:${GUEST_LOCALTIME}:ro" \
  -v "${REPO_DIR}/.toolbox_bashrc:${GUEST_HOME}/.bashrc:ro" \
  -v "${REPO_DIR}:${GUEST_HOME}/repo:z" \
  -v "${HOST_KRB5CONF}:${GUEST_KRB5CONF}:ro" \
  $TOOLBOX:$TOOLBOX_VERSION /bin/bash

#!/bin/sh

set -euo pipefail

if [ -z "$HG_REPO" ];
then
    echo "Error: you must set the \$HG_REPO environment variable to the URL of"
    echo "a Mercurial repo you want to clone and serve."
    exit 1
fi

REPO_NAME=$(basename ${HG_REPO})
REPO_ABS_PATH=/repos/${REPO_NAME}

echo "Cloning ${HG_REPO}"
hg clone --noupdate ${HG_REPO} ${REPO_ABS_PATH}

cd ${REPO_ABS_PATH}

echo "Starting mercurial server for repo '${REPO_NAME}'"
exec hg serve \
    --name ${REPO_NAME} \
    --port ${PORT} \
    --config web.allow_push=* \
    --config web.push_ssl=False

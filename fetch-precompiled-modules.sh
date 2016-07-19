#!/bin/bash

set -x

PRECOMPILED_MODULES=(
    "https://github.com/quarrius/lambda-packages/raw/master/lambda_packages/Pillow/Pillow-3.1.1.tar.gz"
    "https://github.com/quarrius/lambda-packages/raw/master/lambda_packages/lxml/lxml-3.6.0.tar.gz"
    "https://github.com/quarrius/lambda-packages/raw/master/lambda_packages/numpy/numpy-1.10.4.tar.gz"
    "https://github.com/quarrius/lambda-packages/raw/master/lambda_packages/psycopg2/psycopg2-2.6.1.tar.gz"
)

DEST_DIR="${1:-.precompiled-modules}"

if [ ! -d "${DEST_DIR}" ]; then
    mkdir -p "${DEST_DIR}"
fi

for m_url in "${PRECOMPILED_MODULES[@]}"; do
    m_basename="$(basename $m_url)"
    m_dest="${DEST_DIR}/${m_basename}"
    if [ ! -f "${m_dest}" ]; then
        wget -qO "${m_dest}" "${m_url}"
    fi
done

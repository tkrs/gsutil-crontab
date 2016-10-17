#!/bin/sh

mkdir -p ${DOWNLOAD_DIR}
gsutil cp ${SOURCE_PATH} ${DOWNLOAD_DIR}

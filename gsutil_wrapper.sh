#!/bin/sh

if [ ! -z "${SOURCE_PATH}" ] && [ -d "${DOWNLOAD_DIR}" ]; then
  exec gsutil cp "${SOURCE_PATH}" "${DOWNLOAD_DIR}"
else
  exec gsutil "$@"
fi

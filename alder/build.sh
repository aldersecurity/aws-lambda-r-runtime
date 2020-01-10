#!/bin/bash

set -euo pipefail

BASE_DIR=$(pwd)
BUILD_DIR=${BASE_DIR}/build

rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}/layer/R.orig
cd ${BUILD_DIR}/layer
cp -r ${BASE_DIR}/../r/build/bin/* R.orig/
mkdir -p R/library

recommended=(boot DomoR dplyr rlang assertthat glue magrittr pkgconfig methods R6 tibble pillar crayon vctrs tidyselect utils purrr pryr codetools stringr stringi readr hms zeallot backports)
for package in "${recommended[@]}"
do
   mv R.orig/library/${package}/ R/library/${package}/
done
rm -rf R.orig/
chmod -R 755 .

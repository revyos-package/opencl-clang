#!/bin/sh
set -e

commit=${1:-upstream/ocl-open-200}
version=${2:-20}

stamp=$(git show -s --format="%ct" ${commit})
datestamp=$(date -d @${stamp} +"%Y%m%d")
prefix=opencl-clang-${version}.~~+git${datestamp}
tarxzball=${prefix}.tar.xz

git archive --format=tar --prefix=${prefix}/ ${commit} | xz -9 > ${tarxzball}
touch -d @${stamp} ${tarxzball}

echo "Created ${tarxzball}"

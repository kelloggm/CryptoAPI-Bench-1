#!/bin/bash

# this script runs spotbugs on each benchmark inscope for the compliance paper,
# and prints the results to stdout

source utils.sh

SPOTVERSION="4.0.2"
SPOTBUGSJAR="./spotbugs-${SPOTVERSION}/lib/spotbugs.jar"

# if spotbugs isn't already present, fetch it
if [ ! -d "spotbugs-${SPOTVERSION}" ]; then
    wget "https://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/${SPOTVERSION}/spotbugs-${SPOTVERSION}.tgz"
    gunzip -c "spotbugs-${SPOTVERSION}.tgz" | tar xvf -
fi

rm -rf build
mkdir build

create_argfile

echo "running SpotBugs ${SPOTVERSION} on microbenchmarks"


javac -d ${CD}/build `cat arg_file`


for inputdir in ${inputdirs}; do
    echo "-------------"
    echo "${inputdir}"
    echo "-------------"
    java -jar $SPOTBUGSJAR -textui -include spotbugs-security-include.xml -low ${CD}/build/org/cryptoapi/bench/${inputdir}/
done

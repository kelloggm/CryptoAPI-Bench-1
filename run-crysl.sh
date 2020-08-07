#!/bin/bash

source utils.sh

CRYSL_VERSION="2.7.1-SNAPSHOT"

# if the CrySL jar isn't here, go fetch it.
if [ ! -f CryptoAnalysis-${CRYSL_VERSION}-jar-with-dependencies.jar ]; then
    wget https://github.com/CROSSINGTUD/CryptoAnalysis/releases/download/2.7.1/CryptoAnalysis-${CRYSL_VERSION}-jar-with-dependencies.jar
fi

# if the CrySL rules aren't here, fetch them too
if [ ! -d JCA_rules ]; then
    mkdir JCA_rules
    wget https://github.com/CROSSINGTUD/CryptoAnalysis/releases/download/2.7.1/crypto-api-rules.zip
    mv crypto-api-rules.zip JCA_rules
    pushd JCA_rules
    unzip crypto-api-rules.zip
    popd
fi

rm -rf ${CD}/build
mkdir ${CD}/build

create_argfile

javac -d ${CD}/build `cat arg_file`

java -cp CryptoAnalysis-${CRYSL_VERSION}-jar-with-dependencies.jar crypto.HeadlessCryptoScanner --rulesDir=${CD}/JCA_rules/src --applicationCp=${CD}/build/

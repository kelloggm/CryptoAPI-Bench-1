#!/bin/bash

### useful global constants

CD=`pwd`
inputdirs="ecbcrypto brokenhash brokencrypto insecureasymmetriccrypto http predictableseeds predictablecryptographickey predictablekeystorepassword predictablepbepassword staticinitializationvector staticsalts"

### useful functions

# finds all the java files that are in-scope for the compliance paper benchmarks
function create_argfile() {
    rm arg_file
    touch arg_file

    find src/main/java/org/cryptoapi/bench/ecbcrypto -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/brokenhash -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/brokencrypto -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/insecureasymmetriccrypto -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/http -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/predictableseeds -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/predictablecryptographickey -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/predictablekeystorepassword -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/predictablepbepassword -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/staticinitializationvector -name "*.java" >> arg_file
    find src/main/java/org/cryptoapi/bench/staticsalts -name "*.java" >> arg_file
 }

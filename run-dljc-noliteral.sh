#!/bin/sh

export CHECKERFRAMEWORK=/Users/kelloggm/jsr308/checker-framework
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

DLJC=/Users/kelloggm/jsr308/do-like-javac/dljc
CHECKERS='org.checkerframework.checker.noliteral.NoLiteralChecker'

# these are generated by running ./gradlew printClasspath in the root directories
# of each checker, and then removing the reference to the CF itself, which
# DLJC will provide. NLC = No Literal Checker; CPC = Crypto Policy Checker
NLC_CP='/Users/kelloggm/Research/no-literal-checker/no-literal-checker/build/classes/java/main:/Users/kelloggm/Research/no-literal-checker/no-literal-checker/build/resources/main:/Users/kelloggm/Research/no-literal-checker/no-literal-qual/build/libs/no-literal-qual.jar:/Users/kelloggm/.gradle/caches/modules-2/files-2.1/org.checkerframework/checker-qual/3.1.1/361404eff7f971a296020d47c928905b3b9c5b5f/checker-qual-3.1.1.jar'
#CPC_CP='/Users/kelloggm/Research/compliance-ws/comparison-experiments/aws-crypto-policy-compliance-checker/build/classes/java/main:/Users/kelloggm/Research/compliance-ws/comparison-experiments/aws-crypto-policy-compliance-checker/build/resources/main:/Users/kelloggm/.gradle/caches/modules-2/files-2.1/com.google.errorprone/javac/9+181-r4173-1/bdf4c0aa7d540ee1f7bf14d47447aea4bbf450c5/javac-9+181-r4173-1.jar'
#CP=${NLC_CP}':'${CPC_CP}

QUALS='/Users/kelloggm/.gradle/caches/modules-2/files-2.1/org.checkerframework/checker-qual/3.1.1/361404eff7f971a296020d47c928905b3b9c5b5f/checker-qual-3.1.1.jar:/Users/kelloggm/Research/no-literal-checker/no-literal-qual/build/libs/no-literal-qual.jar'

STUBS='/Users/kelloggm/Research/no-literal-checker/no-literal-checker/stubs/'

DLJC_CMD="${DLJC} -t wpi --checker ${CHECKERS} --lib ${NLC_CP} --quals ${QUALS} --stubs ${STUBS} -- gradle clean compileJava"

eval ${DLJC_CMD} < /dev/null

mv dljc-out noliteral-dljc-out

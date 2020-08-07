#!/bin/sh

# don't keep around logs from previous runs
rm -rf dljc-out
rm -rf crypto-dljc-out
rm -rf noliteral-dljc-out

sh run-dljc-crypto.sh
sh run-dljc-noliteral.sh

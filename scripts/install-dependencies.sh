#!/bin/sh

# install Z3 4.6.0
wget https://github.com/Z3Prover/z3/releases/download/z3-4.6.0/z3-4.6.0-x64-ubuntu-14.04.zip
unzip z3-4.6.0-x64-ubuntu-14.04.zip

# install CVC4 1.5
wget http://cvc4.cs.stanford.edu/downloads/builds/x86_64-linux-opt/cvc4-1.5-x86_64-linux-opt -O cvc4
chmod 755 cvc4

# install SPARK Discovery
wget http://mirrors.cdn.adacore.com/art/592c5299c7a447388d5c991d -O spark-discovery-gpl-2017-x86_64-linux-bin.tar.gz
tar zxvf spark-discovery-gpl-2017-x86_64-linux-bin.tar.gz

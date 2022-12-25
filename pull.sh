#!/bin/bash

# This script will decrypt a file using Openssl, then untar it
# Pre-requisites: please install tar, and openssl

source=journal.tar.encrypted
target=journal.tar
decryption_command="openssl aes256 -d -iter 100000 -salt -in ${source} -out ${target}"

eval $decryption_command
tar -xzvf $target

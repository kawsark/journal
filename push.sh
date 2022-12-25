#!/bin/bash

# This script will compress a directory called journal using tar, encrypt it using Openssl, then save it to a backup location
# Please adjust the backup_dir path
# Pre-requisites: please install tar, openssl and shred 

source=journal.tar
target=journal.tar.encrypted
backup_dir=${HOME}/gdrive/journal/

tar -czvf journal/* ${source}

command="openssl aes256 -e -iter 100000 -salt -in ${source} -out ${target}"
eval $command

if [[ $? == 0 ]]; then
        shred ${source} && rm -f ${source}
        shred dgb/* && rm -rf dgb/*
        cp ${target} ${backup_dir}
fi

# Save the push and pull scripts
cp ./pull.sh ${backup_dir}
cp ./push.sh ${backup_dir}

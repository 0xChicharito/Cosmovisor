#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <Junction Home>"
    exit 1
fi

go install cosmossdk.io/tools/cosmovisor/cmd/cosmovisor@latest

export DAEMON_NAME=junctiond
echo "export DAEMON_NAME=junctiond" >> $HOME/.bash_profile
export DAEMON_HOME=$1
echo "export DAEMON_HOME=$1" >> $HOME/.bash_profile
cosmovisor init $(whereis -b junctiond | awk '{print $2}')
mkdir $DAEMON_HOME/cosmovisor/backup
echo "export DAEMON_DATA_BACKUP_DIR=$DAEMON_HOME/cosmovisor/backup" >> $HOME/.bash_profile
echo "export DAEMON_ALLOW_DOWNLOAD_BINARIES=true" >> $HOME/.bash_profile

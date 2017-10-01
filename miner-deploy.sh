#!/bin/bash
######################################################################
################### Minergate Deploy Script ##########################
######################################################################

OS=$1
HOSTNAME=$2
PORT=$3
USERNAME=$4
PASSWORD=$5
M_USER=$6
M_COINS=$7

if [ "$#" -lt 7 ]
then
    echo "Please pass Arguments. Script will exit"
    exit
fi

SUBUNTU='wget https://minergate.com/download/deb-cli -O minergate-cli.deb && sudo dpkg -i minergate-cli.deb && nohup minergate-cli -user ${M_USER} -${M_COINS} > /dev/null 2>&1&'
SCENTOS='wget https://minergate.com/download/rpm-cli -O minergate.rpm && sudo yum -y install minergate.rpm && nohup minergate-cli -user ${M_USER} -${M_COINS} > /dev/null 2>&1&'

if [ $OS = "ubuntu" ]
then
    SCRIPT=$SUBUNTU
elif [ $OS = "centos" ]
then
    SCRIPT=$SCENTOS
fi

sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -l ${USERNAME} -p ${PORT} ${HOSTNAME} "${SCRIPT}"
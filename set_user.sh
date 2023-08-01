#!/bin/bash

USERNAME=lion
PASSWORD=

while getopts "u:p:" opt; do
    case $opt in
        u) 
            USERNAME=$OPTARG
            ;;
        p) 
            PASSWORD=$OPTARG
            ;;
        *)
            echo "Usage: $0 [-u username] [-p password]"
            exit 1
            ;;
    esac
done

if [ -z $PASSWORD ]; then
    echo "password is required"
    echo "Usage: $0 [-u username] [-p password]"
    exit 1
fi

#유저추가
echo "ADD user"
useradd -s /bin/bash -d /home/$USERNAME -m $USERNAME
#비번변경
echo "SET password"
echo "$USERNAME:$PASSWORD" | chpasswd
#권한추가
echo "ADD sudoer"
echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME
usermod -aG sudo $USERNAME
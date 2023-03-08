#!/bin/bash

echo "Installing git pre-push ..."

current_path=`pwd`
leader_path=$current_path/leader/pre-push

read -p "Input your code directory (ex: '/Users/hoangpn/work/buildee/Buildee_ERC_V2'): " install_path

cp $leader_path $install_path/.git/hooks
(cd $install_path;git config advice.ignoredHook false;chmod 766 .git/hooks/pre-push;git init)
echo "Installing git pre-push done"
exit 0

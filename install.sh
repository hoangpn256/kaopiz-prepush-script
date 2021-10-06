#!/bin/bash

echo "Installing git pre-push ..."

current_path=`pwd`
leader_path=$current_path/leader/pre-push
member_path=$current_path/member/pre-push

read -p "Input your code directory (ex: '/Users/hoangpn/work/buildee/Buildee_ERC_V2'): " install_path
read -p "Input your permission (Leader = 1/Member = 0): " permission


echo $leader_path
if [[ $permission == '1' || $permission == '0' ]]; then
    rm -rf $install_path/.git/hooks/pre-push

    if [[ $permission == '1' ]]; then
        cp $leader_path $install_path/.git/hooks
    fi

    if [[ $permission == '0' ]]; then
        cp $member_path $install_path/.git/hooks
    fi

    (cd $install_path;git config advice.ignoredHook false;chmod 766 .git/hooks/pre-push;git init)
    echo "Installing git pre-push done"
    exit 0
fi

echo "Error permission"
exit 1


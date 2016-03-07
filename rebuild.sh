#!/bin/bash
cp $HOME/.ssh/id_rsa .

userid=`getent passwd $USER | cut -d : -f 3`
groupid=`getent passwd $USER | cut -d : -f 4`

docker pull ubuntu:15.10
docker build --no-cache -t ubuntu-user                   \
       --build-arg devuser=$USER                         \
       --build-arg devuserid=${userid}                   \
       --build-arg devgroupid=${groupid}                 \
       --build-arg gitusername="`git config user.name`"  \
       --build-arg gituseremail="`git config user.email`" .

rm id_rsa

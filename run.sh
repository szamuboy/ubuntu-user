#!/bin/bash

docker run -ti -v $HOME:/home/$USER/host --name ubuntu-user ubuntu-user || ( docker start ubuntu-user && docker attach ubuntu-user ) || docker attach ubuntu-user || exit 1
docker rm ubuntu-user

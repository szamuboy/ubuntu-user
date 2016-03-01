#!/bin/bash

#docker run -ti -v $HOME:/home -v $HOME/ssh -u $UID --name spacemacs --workdir /home dhub.ethlab:5000/spacemacs || ( docker start spacemacs && docker attach spacemacs ) || docker attach spacemacs || exit 1
docker run -ti -v $HOME:/home/$USER/host --name ubuntu-user dhub.ethlab:5000/ubuntu-user || ( docker start ubuntu-user && docker attach ubuntu-user ) || docker attach ubuntu-user || exit 1
docker rm ubuntu-user

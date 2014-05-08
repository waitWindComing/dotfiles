#!/bin/bash

curl -vLo- https://bit.ly/janus-bootstrap > ~/.dotfiles/bootstrap/bootstrap-janus.sh
curl -vsL get.freshshell.com > ~/.dotfiles/bootstrap/bootstrap-fresh.sh
curl -vL https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish > ~/.dotfiles/bootstrap/bootstrap-oh-my-fish.sh

chmod 755 ~/.dotfiles/*.sh
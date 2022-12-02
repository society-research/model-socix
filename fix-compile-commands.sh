#!/usr/bin/zsh
set -e
cd $0:A:h
# TODO: dirty, should create $(pwd) inside docker instead
sudo ln -s $(pwd) /src
#sed -e 's,=src, src,g' -i compile_commands.json

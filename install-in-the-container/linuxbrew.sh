#!/bin/sh

set -euv

DIR=$HOME/.tmp/linuxbrew

# download
if [ ! -d $DIR ]; then
    git clone https://github.com/Linuxbrew/brew.git $DIR
    brew doctor
fi

# build and install
if ! /usr/bin/which brew > /dev/null ; then
    exit 9
fi
cat <<++EOS | xargs brew install
    zsh
    tmux
    go
    bc
    tig
    nkf
    jq
    docker
    moreutils
    num-utils
    patchutils
    colordiff
    mecab
    mecab-ipadic
    parallel --force
    jdk
    sbt
    icu4c
    peco
    hugo
    pwgen
++EOS

brew tap sachaos/todoist
brew install todoist

# remove openssh because of libcrypto error
brew uninstall --ignore-dependencies openssl

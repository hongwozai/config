#!/bin/bash

function setup_percol() {
    mkdir -p ~/.percol.d/
    cp percol.py ~/.percol.d/rc.py
}

function setup_bash() {
    echo "setup bash configure."
}

function setup_tmux() {
    echo "setup tmux configure."
    cp tmux.conf ~/.tmux.conf
}
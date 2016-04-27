#!/bin/bash

function setup_percol() {
    mkdir -p ~/.percol.d/
    cp percol.py ~/.percol.d/rc.py
}

function setup_bash() {
    sed -i '$asource ~/config/project.sh' ~/.bashrc
}
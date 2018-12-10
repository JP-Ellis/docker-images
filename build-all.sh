#!/bin/bash

for build in yay texlive pythia root mathematica; do
    docker build $@ $build -t local/$build
done

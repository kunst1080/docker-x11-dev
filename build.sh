#!/bin/bash

set -u

IMAGE=desktop
docker build . -t $IMAGE

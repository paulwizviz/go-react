#!/bin/bash

# Copyright 2020 Paul Sitoh
# 
# Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMAND="$1"

export IMAGE_TAG=current

export IMAGE_NAME=paulwizviz/go-react-container

function checkImageTag() {
    if [ -z "$IMAGE_TAG" ]; then
        echo "$0 $COMMAND image_tag"
        exit 2
    fi
}

function packageContainer() {
    docker build -f ./build/package/production/Dockerfile -t ${IMAGE_NAME}:${IMAGE_TAG} .
}

function packageNative(){
    local native_build_image=hls_devkit/native_build_image:current
    docker build -f ./build/package/production/Dockerfile --target native -t ${native_build_image} .
    cleanNative
    id=$(docker create ${native_build_image})
    CONTAINER_ID="${id:0:12}"
    mkdir -p ./build/native/linux
    docker cp $CONTAINER_ID:/opt/build/package/linux/ ./build/native
    mkdir -p ./build/native/macOS
    docker cp $CONTAINER_ID:/opt/build/package/macOS/ ./build/native
    mkdir -p ./build/native/windows
    docker cp $CONTAINER_ID:/opt/build/package/windows/ ./build/native
    docker rm -f $CONTAINER_ID
    docker rmi -f ${native_build_image}
}

function cleanNative() {
    if [ -d ./build/native ]; then
        rm -rf ./build/native
    fi
}

function cleanImages() {
    docker rmi -f ${IMAGE_NAME}:${IMAGE_TAG}
    docker rmi -f $(docker images --filter "dangling=true" -q)
}

case $COMMAND in
    "native")
        packageNative
        ;;
    "container")
        packageContainer
        ;;
    "clean")
        cleanNative
        cleanImages
        ;;
    *)
        echo "$0 [container | native | clean ]"
        ;;
esac
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

# Modify the following environment variables to suit your requirements

export IMAGE_BASE_NAME=paulwizviz

export APP_IMAGE_NAME=${IMAGE_BASE_NAME}/go-react-container
export APP_IMAGE_TAG=current
export APP_NAME=goreact

export REACT_IMAGE_NAME=${IMAGE_BASE_NAME}/goweb-dev-react
export REST_IMAGE_NAME=${IMAGE_BASE_NAME}/goweb-dev-rest
export IMAGE_TAG=dev

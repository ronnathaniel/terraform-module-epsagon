#! /bin/bash

get_os() {
  unameOutput="$(uname -s)"

  case "${unameOutput}" in
  Linux*) os=Linux ;;
  Darwin*) os=Mac ;;
  CYGWIN*) os=Cygwin ;;
  MINGW*) os=MinGw ;;
  *) os="FOREIGN OS:${unameOutput}" ;;
  esac

  eval "${1}=${os}"
}

delete_build() {
  rm -rf ./src/python/*
  find ./src/nodejs -type f ! -name package.json -delete
  rm -rf ./src/nodejs/node_modules/*
}

build_python() {
  get_os os

  if [[ $os == "Linux" || $os == "Cygwin" ]]; then
    python -m pip install --target=./src/python/lib/python3.8/site-packages -r src/requirements.txt
  elif [[ $os == "Mac" ]]; then
    python3 -m pip install --target=./src/python/lib/python3.8/site-packages -r src/requirements.txt
  fi
}

build_node() {
  start_position="$(pwd)"
  cd src/nodejs || cd .
  npm install
  cd $start_position
}

create_layer_deployments() {
  start_position="$(pwd)"

  cd src || cd .
  zip -r "${start_position}/build/layer_package_python.zip" .

  cd "${start_position}/src/nodejs/node_modules" || cd .
  zip -r "${start_position}/build/layer_package_node.zip" ./*

  cd "${start_position}" || cd .
}

build() {
  build_python
  build_node
  create_layer_deployments
}

delete_build
build

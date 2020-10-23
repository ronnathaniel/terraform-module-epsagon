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

create_layer_deployments() {

  start_position="$(pwd)"

  if [[ -e layer_package_python.zip ]]; then
    rm layer_package_python.zip
  fi

  if [[ -e layer_package_node.zip ]]; then
    rm -rf layer_package_node.zip
  fi

  cd src/python/packages || cd .
  zip "${start_position}/build/layer_package_python.zip" ./*

  cd "${start_position}/src/node/node_modules" || cd .
  zip "${start_position}/build/layer_package_node.zip" ./*

  cd "${start_position}" || cd .
}

delete_build() {
  # to delete all but 'file' in directory
  # find ./PARENT/DIR -type f ! -name FILE -delete

  # to delete all but 'dir' in directory
  # find ./PARENT/DIR -type d ! -name DIR -delete

  rm -rf ./src/python/packages/*

  find ./src/node -type f ! -name package.json -delete
  rm -rf ./src/node/node_modules/*
}

build_python() {
  get_os os

  if [[ $os == "Linux" || $os == "Cygwin" ]]; then
    python -m pip install --target=./src/python/packages -r src/python/requirements.txt
  elif [[ $os == "Mac" ]]; then
    python3 -m pip install --target=./src/python/packages -r src/python/requirements.txt
  fi
}

build_node() {
  npm install --prefix ./src/node epsagon
}

build() {
  build_python
  build_node
  create_layer_deployments
}

delete_build
build

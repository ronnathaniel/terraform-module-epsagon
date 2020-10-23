#! /bin/bash

get_os() {
  # getting local OS running script
  unameOutput="$(uname -s)"

  case "${unameOutput}" in
  Linux*) os=Linux ;;
  Darwin*) os=Mac ;;
  CYGWIN*) os=Cygwin ;;
  MINGW*) os=MinGw ;;
  *) os="FOREIGN OS:${unameOutput}" ;;
  esac

  # sets first func parameter to OS result
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

  cd src/python || cd .
#  zip -r layer_package_python.zip ./*
  zip "${start_position}/layer_package_python.zip" ./*

#  cd ../node/node_modules || cd .
  cd "${start_position}/src/node/node_modules" || cd .

#  zip -r layer_package_node.zip ./*
  zip "${start_position}/layer_package_node.zip" ./*

  cd "${start_position}" || cd .

  #  zip -j layer_package_python.zip ./src/python/*
  #  zip -j layer_package_node.zip ./src/node/node_modules/*
}

delete_build() {
  # to delete all but 'file' in directory
  # find ./PARENT/DIR -type f ! -name FILE -delete

  # to delete all but 'dir' in directory
  # find ./PARENT/DIR -type d ! -name DIR -delete

#  if [[ -d src/python ]]; then
  rm -rf ./src/python/*
#  fi

#  if [[ -d src/node ]]; then
  find ./src/node -type f ! -name package.json -delete
#    fi
  #  find ./src/node/node -type d ! -name node_modules -delete
  rm -rf ./src/node/node_modules/*
}

build_python() {
  get_os os

  if [[ $os == "Linux" || $os == "Cygwin" ]]; then
    python -m pip install --target=./src/python/ -r src/requirements.txt
  elif [[ $os == "Mac" ]]; then
    python3 -m pip install --target=./src/python/ -r src/requirements.txt
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

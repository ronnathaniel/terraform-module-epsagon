#! /bin/bash

get_os() {
  # getting local OS running script
  unameOutput="$(uname -s)"

  case "${unameOutput}" in
    Linux*)   os=Linux;;
    Darwin*)  os=Mac;;
    CYGWIN*)  os=Cygwin;;
    MINGW*)   os=MinGw;;
    *)        os="FOREIGN OS:${unameOutput}";;
  esac

  # sets first func parameter to OS result
  eval "${1}=${os}"
}


delete_build() {
# to delete all but 'file' in directory
# find ./PARENT/DIR -type f ! -name FILE -delete

# to delete all but 'dir' in directory
# find ./PARENT/DIR -type d ! -name DIR -delete

  rm -rf ./src/python/*
  find ./src/node -type f ! -name package.json -delete
  find ./src/node -type d ! -name node_modules -delete
}

build_python() {
  get_os os

  if [[ $os == "Linux"  ||  $os == "Cygwin" ]]
  then
    python -m pip install --target=./src/python/ -r src/requirements.txt
  elif [[ $os == "Mac" ]]
  then
    python3 -m pip install --target=./src/python/ -r src/requirements.txt
  fi
}

build_node() {
  npm install --prefix ./src/node epsagon
}

build() {
  build_python
  build_node
}

delete_build
build
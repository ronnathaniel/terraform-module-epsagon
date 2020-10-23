#! /bin/bash


delete_old_package() {
  if [[ -e function.zip ]]; then
    rm function_package.zip
  fi
}

prepare_deployment_package() {

  zip -r -j function_package.zip src/*
}


build() {

  delete_old_package
  prepare_deployment_package
}


build
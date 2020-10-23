#! /bin/bash


delete_old_package() {
  if [[ -e build/function_package.zip ]]; then
    rm build/function_package.zip
  fi
}

prepare_deployment_package() {
  start_position="$(pwd)"

  cd src || cd .
  zip -r "${start_position}/build/function_package.zip" ./*
  cd $start_position || cd .
}


build() {
  delete_old_package
  prepare_deployment_package
}


build
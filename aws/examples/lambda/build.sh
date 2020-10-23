#! /bin/bash


prepare_deployment_package() {

  if [[ -e function.zip ]]; then
    rm function_package.zip
  fi
  zip -r -j function_package.zip src/*
}


build() {

  terraform fmt
  terraform validate
  terraform apply

}


prepare_deployment_package
build
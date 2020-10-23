#! /bin/bash


prepare_deployment_package() {
    zip -r -j function_package.zip src/*
}


build() {

  terraform fmt
  terraform validate
  terraform apply

}


prepare_deployment_package
build
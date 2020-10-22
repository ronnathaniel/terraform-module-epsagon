#! /bin/bash


build() {

  terraform fmt
  terraform validate
  terraform apply

}

build
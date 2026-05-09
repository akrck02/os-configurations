#!/bin/bash
rm -rf /etc/nixos/*
cp -r ./nixos/* /etc/nixos
cp -r ./secrets /etc/nixos/secrets

#!/bin/bash
rm -rf /etc/nixos/*
cp -r ./nixos/* /etc/nixos
cp -r ./nixos/secrets /etc/nixos/secrets

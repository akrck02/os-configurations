#!/bin/bash

PS3="Select your host please: "

select lng in slimbook-executive-16 fuyu yoga Quit
do
    case $lng in
        "slimbook-executive-16")
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#slimbook-executive-16 ;;
        "fuyu")
        	echo "Installing nixos on host $lng"
         	nixos-rebuild switch --flake /etc/nixos/#slimbook-executive-16 ;;
        "Cyoga")
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#slimbook-executive-16 ;;
        "Quit")
           echo "Okay."
           break;;
        *)
           echo "Ooops, something went wrong :(";;
    esac
done

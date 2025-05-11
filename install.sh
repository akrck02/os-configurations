#!/bin/bash

PS3="Select your host please: "

select lng in slimbook-executive-16 fuyu yoga Quit
do
    case $lng in
        "slimbook-executive-16")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#slimbook-executive-16 ;;
        "fuyu")
        	sh ./deploy.sh
        	echo "Installing nixos on host $lng"
         	nixos-rebuild switch --flake /etc/nixos/#fuyu ;;
        "yoga")
        	sh ./deploy.sh
            echo "Installing nixos on host $lng"
            nixos-rebuild switch --flake /etc/nixos/#yoga ;;
        "Quit")
           echo "Okay."
           break;;
        *)
           echo "Ooops, something went wrong :(";;
    esac
done

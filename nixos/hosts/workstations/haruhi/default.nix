/*
  gnome desktop
*/
{ config, pkgs, lib, ... }:

{

  imports = [
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware.nix

     # You can also split up your configuration and import pieces of it here:
    ../../../users/akrck02/akrck02.nix


   ];


}

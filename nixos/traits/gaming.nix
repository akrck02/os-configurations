/*
  A trait for all gaming machines
*/
{ config, pkgs, lib, ... }:

{
    config = {
      hardware.steam-hardware.enable = true;
    }
}

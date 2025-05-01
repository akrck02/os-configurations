/*
  A trait for media workstations
*/
{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      obs-studio
      lmms
      audacity
    ];
  };
}

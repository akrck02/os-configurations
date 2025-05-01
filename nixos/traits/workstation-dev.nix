/*
  A trait for development workstation
*/
{ config, pkgs, lib, ... }:

{
  config = {

    systemd.services.spotifyd.enable = true;
    programs.neovim.enable = true;
    
    # These should only be GUI applications that are desired systemwide
    environment.systemPackages = with pkgs; [
      docker
      go
      nano
      tree
#      zed-editor
      spotify
      godot_4
      jetbrains.idea-community
#      dbeaver-bin
      android-studio
      telegram-desktop
      firefox
    ];
  };
}

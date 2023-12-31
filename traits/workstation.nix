/*
  A trait for headed boxxen
*/
{ config, pkgs, lib, ... }:

{
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.autoLogin.enable = false;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (with pkgs; [     
    ]) ++ (with pkgs.gnome; [
      gnome-music
      gedit 
      geary 
      gnome-characters
      gnome-contacts
      gnome-maps
      gnome-logs 
      seahorse
      totem
      eog    
      epiphany
      yelp
    ]);


    # So gtk themes can be set
    programs.dconf.enable = true;
    services.dbus.packages = with pkgs; [ dconf ];

    hardware.opengl.driSupport = true;
    #hardware.steam-hardware.enable = true;
    #hardware.xpadneo.enable = true;

    fonts.fontconfig.enable = true;
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      fira-code
      fira-code-symbols
    ];

    systemd.services.spotifyd.enable = true;

    # These should only be GUI applications that are desired systemwide
    environment.systemPackages = with pkgs; [
      vscode
      docker 
      go 
      nano
      tree
      gimp
      gnome.gnome-tweaks
      gnome.gnome-characters
      chromium
      spotify
      obs-studio
      gnome-secrets
      gnome-photos
      godot_4
      pixelorama
      telegram-desktop 
      firefox
      lmms
      audacity
    ];

    services.printing.enable = true;
  };
}


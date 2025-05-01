/*
  A trait for gnome desktop
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
	
    # Fonts configuration
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

    environment.systemPackages = with pkgs; [
      gnome-secrets
      gnome-photos
    ];
  };
}

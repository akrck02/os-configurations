# users/akrck02/home.nix
{ config, pkgs, lib, ... }:

{
  home.username = "akrck02";
  home.homeDirectory = "/home/akrck02";
  home.packages =  with pkgs; [

  ];

  # ...
  programs.home-manager.enable = true;
  home.stateVersion = "22.05";

  programs.git = {
    enable = true;
    userName = "akrck02";
    userEmail = "aketza.vazquez@gmail.com";
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
   };

   home.sessionVariables.GTK_THEME = "Adwaita-dark";

  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "firefox.desktop"
        "org.telegram.desktop.desktop"
        "spotify.desktop"
      ];
    };
    
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = true;
    };

    "org/gnome/desktop/background" = {
      	color-shading-type = "solid";
        picture-uri = "file://etc/nixos/resources/images/akrck02-wallpaper.jpg";
    };
  };
}

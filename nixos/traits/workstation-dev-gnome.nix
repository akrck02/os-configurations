/*
  A trait for gnome desktop
*/
{ config, pkgs, lib, ... }:

{
  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "firefox.desktop"
  	"idea-community.desktop"
	"android-studio.desktop"
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

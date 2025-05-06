 { pkgs, ... }: {

   ## Modules to import
   imports = [

     ## Internet apps
     ../modules/home-manager/internet-browse/firefox.nix

     ## Media consumption apps
     ../modules/home-manager/media-consumption/spotify.nix

     ## Media creation apps
     ../modules/home-manager/media-creation/obs.nix

     ## Productivity apps
     ../modules/home-manager/productivity/obsidian.nix

     ## Social media apps
     ../modules/home-manager/social-media/telegram.nix
     ../modules/home-manager/social-media/discord.nix
   ];

   ## Configuration
   config = {

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";

    ## Basic dnconf configuration
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            cursor-theme = "Adwaita";
            enable-hot-corners = true;
            icon-theme = "Papirus-Dark";
            gtk-theme = "Adwaita-dark";
            show-battery-percentage = true;
        };

        "org/gnome/mutter" = {
            dynamic-workspaces = true;
            edge-tiling = true;
        };

        "org/gnome/shell" = {
            favorite-apps = [
              "org.gnome.Nautilus.desktop"
              "org.gnome.Console.desktop"
              "firefox.desktop"
              "spotify.desktop"
            ];
        };

        # "org/gnome/desktop/background" = {
        #     picture-uri = "file://etc/nixos/resources/images/akrck02-wallpaper.jpg";
        # };
      };
   };
}

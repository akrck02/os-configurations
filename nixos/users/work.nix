 { pkgs, ... }: {

   ## Modules to import
   imports = [

     ## Development apps
     ../modules/home-manager/development/code/intellij.nix
     ../modules/home-manager/development/code/android-studio.nix
     ../modules/home-manager/development/code/neovim.nix
     ../modules/home-manager/development/code/zed.nix

     ../modules/home-manager/development/languages/jdk17.nix

     ../modules/home-manager/development/databases/sql/mariadb-11.4.nix
     ../modules/home-manager/development/databases/visual/dbeaver.nix

     ../modules/home-manager/development/network/bruno.nix
     ../modules/home-manager/development/network/openvpn.nix

     ## Internet apps
     ../modules/home-manager/internet-browse/zen.nix

     ## Media consumption apps
     ../modules/home-manager/media-consumption/spotify.nix

     ## Media creation apps
     ../modules/home-manager/media-creation/obs.nix

     ## Productivity apps
     ../modules/home-manager/productivity/obsidian.nix

     ## Social media apps
     ../modules/home-manager/social-media/telegram.nix
     ../modules/home-manager/social-media/discord.nix
     ../modules/home-manager/social-media/slack.nix

     ## Terminal apps
     ../modules/home-manager/terminal/ghostty.nix

     ## Desktop options
     ../modules/home-manager/desktop/gnome.nix
   ];

   ## Configuration
   config = {

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";

    # Enable git
    programs.git = {
        enable = true;
        userName = "aketza";
        userEmail = "aketza.eguskiza@kaytek.io";
    };

    ## Neovim
    home.file.".config/nvim" = {
        source = ../dotfiles/.nvim;
        recursive = true;
    };

    ## Wallpaper
    home.file."Pictures/wallpaper.jpg" = {
        source = ../dotfiles/wallpapers/work.jpg;
    };


    ## Profile pic
    home.file.".face" = {
        source = ../dotfiles/profile-pictures/work.jpg;
    };

    ## Basic dnconf configuration
    dconf.settings = {
        "org/gnome/desktop/interface" = {
            accent-color = "teal";
        };

        "org/gnome/shell" = {
            favorite-apps = [
                "org.gnome.Nautilus.desktop"
                "com.mitchellh.ghostty.desktop"
                "zen.desktop"
                "spotify.desktop"
                "idea-community.desktop"
                "android-studio.desktop"
                "dbeaver.desktop"
            ];
            disable-user-extensions = false;
            enabled-extensions = with pkgs.gnomeExtensions; [
              blur-my-shell.extensionUuid
            ];
        };

        "org/gnome/shell/extensions/blur-my-shell/applications" = {
          blur=true;
          blur-on-overview=false;
          brightness=1.0;
          dynamic-opacity=false;
          enable-all=false;
          opacity=215;
          sigma=30;
          whitelist=["org.gnome.Nautilus" "com.mitchellh.ghostty" "dev.zed.Zed"];
        };

        "org/gnome/desktop/background" = {
            picture-uri = "file:///home/work/Pictures/wallpaper.jpg";
            picture-uri-dark = "file:///home/work/Pictures/wallpaper.jpg";
        };
      };
    };
}

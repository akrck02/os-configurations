 { inputs, lib, pkgs, config, ... }: {

   ## Modules to import
   imports = [

     ## Development apps
     ../modules/home-manager/development/code/intellij.nix
     ../modules/home-manager/development/code/android-studio.nix
     ../modules/home-manager/development/code/neovim.nix
     ../modules/home-manager/development/code/zed.nix

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

     ## Terminal apps
     ../modules/home-manager/terminal/ghostty.nix

     ## Desktop options
     ../modules/home-manager/desktop/gnome.nix

   ];

   config = {

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";

    # Enable git
    programs.git = {
        enable = true;
        userName = "akrck02";
        userEmail = "aketza.vazquez@gmail.com";
    };

    ## Neovim
    home.file.".config/nvim" = {
        source = ../dotfiles/.nvim;
        recursive = true;
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
                "firefox.desktop"
                "spotify.desktop"
                "idea-community.desktop"
                "android-studio.desktop"
            ];
            disable-user-extensions = false;
            enabled-extensions = with pkgs.gnomeExtensions; [
              blur-my-shell.extensionUuid
            ];
        };

        # "org/gnome/desktop/background" = {
        #     picture-uri = "file://etc/nixos/resources/images/akrck02-wallpaper.jpg";
        # };
      };
   };
}

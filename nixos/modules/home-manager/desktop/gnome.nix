 { lib, pkgs, config, ... }: {

   ## GTK
   gtk.enable = true;
   gtk.iconTheme.package = lib.mkForce pkgs.papirus-icon-theme;
   gtk.iconTheme.name = lib.mkForce "Papirus-Dark";

   ## Basic dnconf configuration
   dconf.settings = {
       "org/gnome/desktop/interface" = {
           color-scheme = "prefer-dark";
           cursor-theme = "Adwaita";
           enable-hot-corners = true;
           accent-color = "teal";
           icon-theme = "Papirus-Dark";
           gtk-theme = "Adwaita-dark";
           show-battery-percentage = true;
       };

       "org/gnome/mutter" = {
           dynamic-workspaces = true;
           edge-tiling = true;
       };

       "org/gnome/shell" = {
           favorite-apps = [];
           disable-user-extensions = false;
           enabled-extensions = with pkgs.gnomeExtensions; [
             blur-my-shell.extensionUuid
           ];
       };

       "org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
     };

 }

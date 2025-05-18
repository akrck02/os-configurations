# gnome desktop
{
  pkgs,
  ...
}:
{

  ## Configuration
  config = {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "es";
      variant = "winkeys";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Set gnome apps
    environment.gnome.excludePackages = with pkgs; [
      gnome-music
      gnome-tour
      xterm
      gedit
      geary
      gnome-contacts
      gnome-maps
      gnome-logs
      seahorse
      totem
      eog
      epiphany
      gnome-console
      gnome-connections
      gnome-system-monitor
      yelp
    ];
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [
      gnome-secrets
      gnome-tweaks
    ];
  };
}

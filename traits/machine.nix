/*
  A trait for configurations which are most definitely machines
*/
{ pkgs, ... }:

{
  config = {
   
    powerManagement.cpuFreqGovernor = "ondemand";

    networking.networkmanager.enable = true;
    networking.wireless.enable = false; # For Network Manager
    networking.firewall.enable = true;
  
    programs.nm-applet.enable = true;
    hardware.bluetooth.enable = true;

    sound.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    security.rtkit.enable = true;
    hardware.pulseaudio.enable = false;

    # opt in state
    # From https://mt-caret.github.io/blog/posts/2020-06-29-optin-state.html
    environment.etc = {
      nixos.source = "/persist/etc/nixos";
      "NetworkManager/system-connections".source = "/persist/etc/NetworkManager/system-connections";
      adjtime.source = "/persist/etc/adjtime";
      machine-id.source = "/persist/etc/machine-id";
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.editor = true;
    boot.initrd.systemd.enable = true;

  };
}

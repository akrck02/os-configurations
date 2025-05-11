# Slimbook executive 16 custom configuration
{ pkgs, lib, config, inputs, home-manager, ...} : {



  ## Configuration
  config = {

    ## System state version
    system.stateVersion = "24.11";

    # Allow experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow unfree software
    nixpkgs.config.allowUnfree = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.grub.devices = [
    	"/dev/disk/by-uuid/2571a6d5-7690-4c85-800d-f6e474855600"
    ]

    # Hostname
    networking.hostName = "yoga";

    # Enable networking
    networking.networkmanager.enable = true;

    # Exclude xterm
    services.xserver.excludePackages = [pkgs.xterm];

  };

  ## Modules to import
  imports = [
    ./hardware.nix
    ./power-management.nix
    ../../../profiles/low-power-server.nix
  ];
}

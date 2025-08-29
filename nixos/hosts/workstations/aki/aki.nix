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
    boot.loader.efi.canTouchEfiVariables = true;

    # Hostname
    networking.hostName = "aki";

    # Enable networking
    networking.networkmanager.enable = true;

    # Exclude xterm
    services.xserver.excludePackages = [pkgs.xterm];

    # Sops
    sops = {
	    age.keyFile = "/etc/nixos/secrets/sops/age/keys.txt";

	    defaultSopsFile = ./secrets/secrets.yaml;
	    defaultSymlinkPath = "/run/user/1000/secrets";
	    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
    }

  };

  ## Modules to import
  imports = [
    ./hardware.nix
    ./drivers/drivers.nix
    ./power-management.nix

    # Imported shared modules
    ../../../profiles/workstation.nix
  ];
}

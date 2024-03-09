/*
  A trait for all boxxen
*/
{ config, pkgs, lib, ... }:

{
  config = {
    time.timeZone = "Europe/Madrid";
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_NAME = "es_ES.UTF-8";
      LC_NUMERIC = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };

    environment.systemPackages = with pkgs; [
      # Shell utilities
      git
      htop
      neofetch
    ];
    environment.shellAliases = { };
    environment.variables = {
      
    };
    environment.pathsToLink = [
      "/share/nix-direnv"
    ];

    # Use edge NixOS.
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
    nix.package = pkgs.nixUnstable;

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    nixpkgs.config.allowUnfree = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?
  };
}

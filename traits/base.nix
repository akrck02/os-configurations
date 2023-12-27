/*
  A trait for all boxxen
*/
{ config, pkgs, lib, ... }:

{
  config = {
    time.timeZone = "America/Vancouver";
    # Windows wants hardware clock in local time instead of UTC
    time.hardwareClockInLocalTime = true;

    i18n.defaultLocale = "en_CA.UTF-8";

    environment.systemPackages = with pkgs; [
      # Shell utilities
      patchelf
      direnv
      nix-direnv
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

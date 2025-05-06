{ config, pkgs, lib, ... }: {

  ## Modules to import
  imports = [
    ./cli/cli.nix
    ./desktop/desktop.nix
    ./development/development.nix
    ./gaming/gaming.nix
    ./internet-browse/internet-browse.nix
    ./media-consumption/media-consumption.nix
    ./media-creation/media-creation.nix
    ./networking/networking.nix
    ./productivity/productivity.nix
    ./social-media/social-media.nix
  ]
}

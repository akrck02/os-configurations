{ config, pkgs, lib, ... }: {

  ## Modules to import
  imports = [
    ./cli/cli.nix
    ./networking/networking.nix
  ];

  config = {
  	programs.git.enable = true;
  };
}

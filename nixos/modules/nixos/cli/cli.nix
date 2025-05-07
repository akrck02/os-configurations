{ config, pkgs, lib, ... }: {

  ## Modules to import
  imports = [
    ./btop.nix
    ./nitch.nix
    ./tree.nix
    ./wget.nix
    ./zsh.nix
    ./fzf.nix
  ];

}

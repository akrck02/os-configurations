{ config, pkgs, lib, ... }: {

  ## Modules to import
  imports = [
    ./btop/btop.nix
    ./nitch/nitch.nix
    ./tree/tree.nix
    ./wget/wget.nix
    ./zsh/zsh.nix
  ];

}

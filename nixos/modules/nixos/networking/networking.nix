{ config, pkgs, lib, ... }: {

  ## Modules to import
  imports = [
    ./ssh/ssh.nix
    ./tailscale/tailscale.nix
  ];

}

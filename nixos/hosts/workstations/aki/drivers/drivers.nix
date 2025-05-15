# drivers install
{ config, lib, pkgs, inputs, ... }:

{
  ## Modules to import
  imports = [
    ./nvidia/nvidia.nix
  ];
}

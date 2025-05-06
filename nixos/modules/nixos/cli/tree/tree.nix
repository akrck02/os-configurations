# tree install
{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    tree
  ];
}

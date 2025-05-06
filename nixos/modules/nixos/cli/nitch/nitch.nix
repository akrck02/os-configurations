# nitch install
{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    nitch
  ];
}

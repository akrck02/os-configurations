# wget install
{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
  ];
}

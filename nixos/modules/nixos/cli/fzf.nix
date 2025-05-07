# fzf install
{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    fzf
  ];
 # programs.fzf.enable = true;
}

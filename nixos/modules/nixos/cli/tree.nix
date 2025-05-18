# tree install
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
  ];
}

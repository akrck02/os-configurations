# nixfmt install
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ nixfmt-rfc-style ];
}

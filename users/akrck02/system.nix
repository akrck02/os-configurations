# users/akrck02/default.nix
{ lib, pkgs, ... }:

{
  config = {
    home-manager.users.akrck02 = ./home.nix;
      users.users.akrck02 = {
        isNormalUser = true;
        home = "/home/akrck02";
        description = "akrck02";
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" ];
        openssh.authorizedKeys.keys = [];
      };
  };
}

# tailscale install
{ config, lib, pkgs, inputs, ... }:

{
  config = {
    services.tailscale.enable = true;
    services.tailscale.port = 41641;
    networking.firewall = {
     	allowedUDPPorts = [ config.services.tailscale.port ];
     	checkReversePath = "loose";
      trustedInterfaces = [ "tailscale0" ];
    };
    environment.systemPackages = with pkgs; [ tailscale ];
  };
}

# tailscale install
{ config, lib, pkgs, inputs, ... }:

{
  config = {
    services.tailscale.enable = true;
    services.tailscale.port = 41641;
    networking.firewall.allowedUDPPorts = [ 41641 ];
    environment.systemPackages = with pkgs; [ tailscale ];
  };
}

{ pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      resources
    ];
  };
}

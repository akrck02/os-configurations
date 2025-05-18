# hyprland install
{
  config,
  lib,
  ...
}:

{
  ## Options of the flake
  options = {
    config.desktop-hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.desktop-hyprland.enable {
    # TODO enable hyprland
  };

}

{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      telegram-desktop
    ];
  };
}

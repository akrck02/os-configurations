{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}

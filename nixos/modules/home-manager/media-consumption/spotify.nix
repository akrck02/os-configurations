{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      spotify
      spot
    ];
  };
}

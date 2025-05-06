{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}

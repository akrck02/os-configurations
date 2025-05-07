{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      zed-editor
    ];
  };
}

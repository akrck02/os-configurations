{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      bruno
    ];
  };
}

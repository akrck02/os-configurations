{ pkgs, lib, config, ...} : {

  config = {
    home.packages = with pkgs; [
      jetbrains.idea-community
    ];
  };
}

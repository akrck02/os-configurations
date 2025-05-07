{ pkgs, inputs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      inputs.zen-browser.packages.${pkgs.system}.default
    ];
  };
}

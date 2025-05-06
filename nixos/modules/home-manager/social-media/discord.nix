{ pkgs, lib, config, ...} : {
  config = {
    home.packages = with pkgs; [
      discord-ptb
    ];
  };
}

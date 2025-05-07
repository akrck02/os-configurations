# zsh install
{ config, lib, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    shellAliases = {
        #...
    };
    setOptions = [
        "AUTO_CD"
    ];
    # prompInit = ''
    #   source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    # '';
    ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "sudo" "docker" "git" "dirhistory" "history" ];
    };
  };
}

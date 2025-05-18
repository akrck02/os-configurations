# zsh install
{
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
    shellAliases = { };
    setOptions = [
      "AUTO_CD"
    ];
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "sudo"
        "docker"
        "git"
        "dirhistory"
        "history"
      ];
    };
  };
}

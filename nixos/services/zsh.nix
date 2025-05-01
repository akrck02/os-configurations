{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
   
    ohMyZsh = {
       enable = true;
       plugins = [ "git" ];
       theme = "robbyrussell";
    };

    # set some aliases, feel free to add more or remove some
    shellAliases = {
       vi = "nvim";
    };
  };
}

{ config, pkgs, ... }:

{
  
  home.username = "akrck02";
  home.homeDirectory = "/home/akrck02";

  home.file.".nvim" = {
     source = ./neovim-configurations;
     recursive = true;   # link recursively
     executable = true;  # make all files executable
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    btop
    wget
    fastfetch
    docker
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "akrck02";
    userEmail = "aketza.vazquez@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
   
    oh-my-zsh = {
       enable = true;
       plugins = [ "git" "thefuck" ];
       theme = "robbyrussell";
    };

    # set some aliases, feel free to add more or remove some
    shellAliases = {
       vi = "nvim"
    };
  };

  users.defaultUserShell = pkgs.zsh;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

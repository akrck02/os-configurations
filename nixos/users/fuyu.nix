{ ... }:
{

  ## Modules to import
  imports = [

    ## Development apps
    ../modules/home-manager/development/code/neovim.nix

    ../modules/home-manager/development/languages/python313.nix
    ../modules/home-manager/development/languages/typescript.nix

  ];

  config = {

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";

    # Enable git
    programs.git = {
      enable = true;
      userName = "akrck02";
      userEmail = "aketza.vazquez@gmail.com";
    };

    ## Neovim
    home.file.".config/nvim" = {
      source = ../dotfiles/.nvim;
      recursive = true;
    };
  };
}

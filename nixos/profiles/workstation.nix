{ pkgs, lib, config, inputs, home-manager, ...} : {

  ## Modules to import
  imports = [
    ../modules/nixos/desktop/gnome.nix
    ../modules/nixos/languages/english-es.nix
    ../modules/nixos/cli/cli.nix
    ../modules/nixos/networking/networking.nix
    ../modules/nixos/containers/docker.nix
  ];

  ## Configuration
  config = {

    home-manager.useGlobalPkgs = true;
    home-manager.backupFileExtension = "back";

    environment.systemPackages = with pkgs; [papirus-icon-theme];

    # Development user
    users.users.development = {
        isNormalUser = true;
        home = "/home/development";
        initialPassword = "12345";
        description = "development";
        shell = pkgs.zsh;
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        openssh.authorizedKeys.keys = [];
    };
    home-manager.users.development = import ../users/development.nix;

    # Work user
    users.users.work = {
        isNormalUser = true;
        home = "/home/work";
        initialPassword = "12345";
        shell = pkgs.zsh;
        description = "work";
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        openssh.authorizedKeys.keys = [];
    };
    home-manager.users.work = import ../users/work.nix;

    # Media user
    users.users.media = {
        isNormalUser = true;
        home = "/home/media";
        initialPassword = "12345";
        shell = pkgs.zsh;
        description = "media";
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" ];
        openssh.authorizedKeys.keys = [];
    };
    home-manager.users.media = import ../users/media.nix;

  };
}

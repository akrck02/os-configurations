{ pkgs, inputs, ...} : {

 ## Modules to import
  imports = [
    ../modules/nixos/languages/english-es.nix
    ../modules/nixos/cli/cli.nix
    ../modules/nixos/networking/networking.nix
    ../modules/nixos/containers/docker.nix
    ../modules/nixos/development/language.servers.nix
    ../modules/nixos/dashboards/homepage.nix
  ];

  ## Configuration
  config = {

	  home-manager.useGlobalPkgs = true;
	  home-manager.extraSpecialArgs = {inherit inputs;};
	  home-manager.backupFileExtension = "back";

		# Development user
    users.users.fuyu = {
        isNormalUser = true;
        home = "/home/fuyu";
        initialPassword = "12345";
        description = "Admin user for fuyu server";
        shell = pkgs.zsh;
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        openssh.authorizedKeys.keys = [];
    };
    home-manager.users.fuyu = import ../users/fuyu.nix;

  };
}

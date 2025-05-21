{ pkgs, inputs, ...} : {

 ## Modules to import
  imports = [
    ../modules/nixos/languages/english-es.nix
    ../modules/nixos/cli/cli.nix
    ../modules/nixos/networking/networking.nix
    ../modules/nixos/containers/docker.nix
    ../modules/nixos/development/language.servers.nix
  ];

  ## Configuration
  config = {

	  home-manager.useGlobalPkgs = true;
	  home-manager.extraSpecialArgs = {inherit inputs;};
	  home-manager.backupFileExtension = "back";

	  environment.systemPackages = with pkgs; [];

		# Development user
    users.users.natsu = {
        isNormalUser = true;
        home = "/home/natsu";
        initialPassword = "12345";
        description = "Admin user for natsu server";
        shell = pkgs.zsh;
        createHome = true;
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        openssh.authorizedKeys.keys = [];
    };
    home-manager.users.natsu = import ../users/natsu.nix;

  };
}

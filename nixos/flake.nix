{
  # Metadata of the flake
  description = "Akrck02's machines configurations flake";

  # Inputs for the flake
  inputs = {

    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # SOPS
    sops-nix.url = "github:Mic92/sops-nix";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

  };

  # Outputs of the flake
  outputs =
    { self, nixpkgs, sops-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      pkgs = import nixpkgs { inherit system; };
    in {

    	# Configure SOPS for secrets
    	imports = [ inputs.sops-nix.nixosModules.sops ];
      sops-nix.defaultSopsFile = ./secrets/secrets.yaml;
      sops-nix.defaultSopsFormat = "yaml";
     	sops-nix.age.keyFile = "/etc/nixos/secrets/sops/age/keys.txt";

      # Workstations
      nixosConfigurations.aki = pkgs.lib.nixosSystem {
      	inherit system;
        inherit specialArgs;
        modules = [
          ./hosts/workstations/aki/aki.nix
          sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
          }
        ];
      };

      nixosConfigurations.haruhi = nixpkgs.lib.nixosSystem {
     		inherit system;
       	inherit specialArgs;
        modules = [
          ./hosts/workstations/haruhi/default.nix
          sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
          }
        ];
      };

       # Servers
      nixosConfigurations.fuyu = nixpkgs.lib.nixosSystem {
    		inherit system;
      	inherit specialArgs;
        modules = [
          ./hosts/servers/fuyu/fuyu.nix
          sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
          }
        ];
      };

      nixosConfigurations.natsu = nixpkgs.lib.nixosSystem {
    		inherit system;
      	inherit specialArgs;
        modules = [
          ./hosts/servers/natsu/natsu.nix
          sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.default
          home-manager.nixosModules.home-manager {
            home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
          }
        ];
      };
    };
}

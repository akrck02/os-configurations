{
  # Metadata of the flake
  description = "Akrck02's machines configurations flake";

  # Inputs for the flake
  inputs = {

    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    # stylix = {
    #   url = "github:danth/stylix/master";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #     home-manager.follows = "home-manager";
    #     git-hooks.follows = "pre-commit-hooks-nix";
    #     flake-utils.follows = "flake-utils";
    #   };
    # };
  };

  # Outputs of the flake
  outputs = { self, nixpkgs, ... }@inputs: {

      # homeManagerModules.default = ./modules/home-manager;
      nixosConfigurations = {

        # Workstations
        slimbook-executive-16 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/workstations/slimbook-executive-16/slimbook-executive-16.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        nixosConfigurations.haruhi = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             # ./hardware/workstations/haruhi/default.nix
             inputs.home-manager.nixosModules.default
           ];
        };

        # Servers
        nixosConfigurations.fuyu = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             # ./hardware/servers/fuyu/default.nix
             inputs.home-manager.nixosModules.default
           ];
        };

        nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             # ./hardware/servers/yoga/default.nix
             inputs.home-manager.nixosModules.default
           ];
        };
      };
  };
}

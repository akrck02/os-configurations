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

    # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Outputs of the flake
  outputs =
    { self, nixpkgs, ... }@inputs:
    {

      nixosConfigurations = {

        # Workstations
        aki = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/workstations/aki/aki.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        haruhi = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # ./hosts/workstations/haruhi/default.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        # Servers
        fuyu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/servers/fuyu/fuyu.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        natsu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/servers/natsu/natsu.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}

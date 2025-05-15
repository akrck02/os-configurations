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

        haruhi = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             # ./hardware/workstations/haruhi/default.nix
             inputs.home-manager.nixosModules.default
           ];
        };

        # Servers
        fuyu = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             ./hardware/servers/fuyu/fuyu.nix
             inputs.home-manager.nixosModules.default
           ];
        };

        yoga = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           specialArgs = {inherit inputs;};
           modules = [
             ./hosts/servers/yoga/yoga.nix
             inputs.home-manager.nixosModules.default
           ];
        };
      };
  };
}

# flake.nix
{

  description = "Akrck02's development machine flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager}:
  let 
    supportedSystems = [ "x86_64-linux"];
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
  in {

    homeConfigurations = forAllSystems
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlays.default ];
          };
        in
        {
          akrck02 = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./users/akrck02/home.nix
            ];
          };
        }
      );

    nixosModules = {
      traits.base = ./traits/base.nix;
      traits.machine = ./traits/machine.nix;
      # traits.gaming = ./traits/gaming.nix;
      traits.hardened = ./traits/hardened.nix;
      traits.workstation = ./traits/workstation.nix;
      services.openssh = ./services/openssh.nix;
      users.akrck02 = ./users/akrck02/system.nix;
      platforms.modern14 = ./platforms/modern14.nix;
    };

    nixosConfigurations =
      let
        x86_64Base = {
          system = "x86_64-linux";
          modules = with self.nixosModules; [
            ({ config = { nix.registry.nixpkgs.flake = nixpkgs; }; })
            home-manager.nixosModules.home-manager
            traits.base
            services.openssh
          ];
        };
      in
      with self.nixosModules; {
        x86_64-dev-modern14 = nixpkgs.lib.nixosSystem {
          inherit (x86_64Base) system;
          modules = x86_64Base.modules ++ [
            platforms.modern14
            traits.machine
            traits.workstation
            traits.hardened
            users.akrck02
          ];
        };
      };
  };
}
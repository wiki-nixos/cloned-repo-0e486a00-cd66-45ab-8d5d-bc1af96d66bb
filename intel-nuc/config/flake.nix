{
  description = "Your new nix config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos-intel-nuc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos
          home-manager.nixosModules.home-manager
          ({config, ...}: {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.user = ./home-manager;
            };
          })
        ];
      };
    };
  };
}


{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  inputs.nur.url = github:nix-community/NUR;

  outputs = { nixpkgs, home-manager, nur, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos-intel-nuc = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nur.nixosModules.nur
          ./nixos
          home-manager.nixosModules.home-manager
          ({config, ...}: {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.user = ./home-manager/home.nix;
              extraSpecialArgs.nur = config.nur;
            };
          })
        ];
      };
    };
  };
}


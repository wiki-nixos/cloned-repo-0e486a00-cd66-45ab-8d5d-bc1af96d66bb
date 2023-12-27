{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos

          home-manager.nixosModules.home-manager
          nur.nixosModules.nur

          ({ config, ... }: {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              users.user = ./home-manager;
              extraSpecialArgs.nur = config.nur;
            };
          })
        ];
      };
    };
  };
}


{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-joplin.url = "github:nixos/nixpkgs/517501bcf14ae6ec47efd6a17dda0ca8e6d866f9"; # 2.12.16

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, ... }@ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
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

          {
            nixpkgs.overlays = [
              (final: prev: {
                inherit (inputs.nixpkgs-joplin.legacyPackages.${system}) joplin-desktop;
              })
            ];
          }
        ];
      };
    };
  };
}


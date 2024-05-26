{
  description = "the simplest flake for nixos-rebuild";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      intel-nuc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
              modules = [
                ./nixos
              ];
      };
    };
  };
}
# This can be built with nixos-rebuild --flake .#rpi-silver-nixos build
{
  description = "the simplest flake for nixos-rebuild";

  inputs = {
    nixpkgs = {
      # Using the nixos-unstable branch specifically, which is the
      # closest you can get to following the equivalent channel with flakes.
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  # Outputs can be anything, but the wiki + some commands define their own
  # specific keys. Wiki page: https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, nixpkgs }: {
    # nixosConfigurations is the key that nixos-rebuild looks for.
    nixosConfigurations = {
      rpi-silver-nixos-sd-boot = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        # Import our old system configuration.nix
              modules = [
                ./nixos
                ./hardware-configuration/sd-boot.nix
              ];
      };

            rpi-silver-nixos-usb-boot = nixpkgs.lib.nixosSystem {
              system = "aarch64-linux";
              # Import our old system configuration.nix
              modules = [
                ./nixos
                ./hardware-configuration/usb-boot.nix
              ];
            };
    };
  };
}
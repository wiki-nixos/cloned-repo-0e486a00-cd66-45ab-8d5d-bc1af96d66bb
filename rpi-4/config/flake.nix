# This can be built with nixos-rebuild --flake .#rpi-silver-nixos build
{
  description = "the simplest flake for nixos-rebuild";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  # Outputs can be anything, but the wiki + some commands define their own
  # specific keys. Wiki page: https://nixos.wiki/wiki/Flakes#Output_schema
  outputs = { self, nixpkgs, nixos-hardware }: {
    # nixosConfigurations is the key that nixos-rebuild looks for.
    nixosConfigurations = {
      rpi-silver-nixos-sd-boot = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        # Import our old system configuration.nix
              modules = [
                nixos-hardware.nixosModules.raspberry-pi-4
                ./nixos
                ./hardware-configuration/sd-boot.nix
              ];
      };

            rpi-silver-nixos-usb-boot = nixpkgs.lib.nixosSystem {
              system = "aarch64-linux";
              # Import our old system configuration.nix
              modules = [
                  nixos-hardware.nixosModules.raspberry-pi-4
                ./nixos
                ./hardware-configuration/usb-boot.nix
              ];
            };
    };
  };
}
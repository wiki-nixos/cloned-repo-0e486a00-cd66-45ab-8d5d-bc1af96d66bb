# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

      # Bootloader.
      boot.loader = {
          # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
          grub.enable = false;
         # Enables the generation of /boot/extlinux/extlinux.conf
         generic-extlinux-compatible.enable = true;
      };

 hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
        htop
        vim
        wget
        tree
        git
    ];
}


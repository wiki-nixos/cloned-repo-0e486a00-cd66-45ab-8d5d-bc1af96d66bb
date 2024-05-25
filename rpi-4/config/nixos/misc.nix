# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
      # Bootloader.
      boot.loader = {
          # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
          grub.enable = false;
         # Enables the generation of /boot/extlinux/extlinux.conf
         generic-extlinux-compatible.enable = true;
      };

 hardware.enableRedistributableFirmware = true;
  hardware = {
     raspberry-pi."4".apply-overlays-dtmerge.enable = true;
     deviceTree = {
       enable = true;
       filter = "*rpi-4-*.dtb";
     };
   };

  environment.systemPackages = with pkgs; [
        htop
        vim
        wget
        tree
        git

        # for updating kernel and so on (https://wiki.nixos.org/wiki/NixOS_on_ARM/Raspberry_Pi_4#USB_boot)
         libraspberrypi
          raspberrypi-eeprom
    ];
}


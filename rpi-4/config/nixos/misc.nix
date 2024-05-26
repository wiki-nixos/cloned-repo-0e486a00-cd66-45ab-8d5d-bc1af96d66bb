# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
      # Bootloader.

  boot = {
    loader.raspberryPi.firmwareConfig = ''
      dtparam=audio=on
    '';
    extraModprobeConfig = ''
      options snd_bcm2835 enable_headphones=1
    '';
  };
      boot.loader = {
          grub.enable = false;
         generic-extlinux-compatible.enable = true;
      };

 hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
        htop
        vim
        wget
        tree
        git

        # for updating kernel and so on (https://wiki.nixos.org/wiki/NixOS_on_ARM/Raspberry_Pi_4#USB_boot)
         libraspberrypi
          raspberrypi-eeprom

        # audio
        pavucontrol
        pulseaudioFull
    ];
}


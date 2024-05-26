# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
      # Bootloader.
      boot = {

           initrd.availableKernelModules = [
              "usbhid"
              "usb_storage"
              "vc4"
              "pcie_brcmstb" # required for the pcie bus to work
              "reset-raspberrypi" # required for vl805 firmware to load
            ];
          loader = {
              grub.enable = false;
             generic-extlinux-compatible.enable = true;
          };
      };
          boot.extraModulePackages = [ ];
          boot.kernelParams = [ ];


        hardware = {
            bluetooth.enable = true;
            #deviceTree.filter = "bcm2711-rpi-*.dtb"; ??

            enableRedistributableFirmware = true;
            pulseaudio = {
              extraConfig = "load-module module-native-protocol-tcp port=4713 listen=0.0.0.0 auth-anonymous=true";
              enable = true;
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

        # audio
        pavucontrol
        pulseaudioFull
    ];
}


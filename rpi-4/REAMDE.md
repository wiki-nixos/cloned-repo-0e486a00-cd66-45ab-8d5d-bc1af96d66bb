
# rpi 4 config:

getting an initial build with: https://github.com/Robertof/nixos-docker-sd-image-builder


nix flake init --experimental-features 'nix-command flakes'


try out performance of this option:

# also try out:  hardware.raspberry-pi."4".fkms-3d.enable = true;??



hardware.raspberry-pi."4".fkms-3d.enable = true;

sound.enable = true;
hardware.pulseaudio.enable = true;
hardware.raspberry-pi."4".audio.enable = true;


      # Bootloader.
        boot = {
          kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
          initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
          loader = {
            grub.enable = false;
            generic-extlinux-compatible.enable = true;
          };
        };






boot = {
    loader.raspberryPi.firmwareConfig = ''
    dtparam=audio=on
    '';
    extraModprobeConfig = ''
    options snd_bcm2835 enable_headphones=1
    '';
};




hardware.raspberry-pi."4" = {
fkms-3d.enable = true;
audio.enable = true;
dwc2.enable = true;
};

sound.enable = true;


hardware.pulseaudio = {
enable = true;
package = pkgs.pulseaudioFull;
};



pactl load-module module-native-protocol-tcp port=4713 listen=0.0.0.0 auth-anonymous=true
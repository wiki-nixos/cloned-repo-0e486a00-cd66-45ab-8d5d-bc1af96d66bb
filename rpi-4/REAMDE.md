
# rpi 4 config:

getting an initial build with: https://github.com/Robertof/nixos-docker-sd-image-builder


nix flake init --experimental-features 'nix-command flakes'


try out performance of this option:

# also try out:  hardware.raspberry-pi."4".fkms-3d.enable = true;??
hardware.raspberry-pi."4".fkms-3d.enable = true;



just wait for fucking 5 seconds until the audio server has started...

...need to run.. to make it work after autostart?:
 pactl list modules | grep module-native-protocol-tcp


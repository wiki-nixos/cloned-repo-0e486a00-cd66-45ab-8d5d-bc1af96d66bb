{ pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.raspberry-pi."4".audio.enable = true;
}

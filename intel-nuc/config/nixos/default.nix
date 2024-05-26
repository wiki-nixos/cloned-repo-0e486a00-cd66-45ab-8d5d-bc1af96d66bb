{ config, pkgs, ... }:


{

nix.settings.experimental-features = [ "nix-command flakes" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
  ./hardware-configuration.nix
   ./xfce.nix
  ./misc.nix
  ./users.nix
  ./networking.nix
  ./audio.nix
  ];



  system.stateVersion = "23.05"; # Did you read the comment?
}

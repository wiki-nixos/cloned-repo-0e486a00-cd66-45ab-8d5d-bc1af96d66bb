{
  imports = [
  # Include the results of the hardware scan.
   ./hardware-configuration.nix

    ./misc.nix
    ./users.nix
    ./networking.nix

    ./xserver.nix
  ];

    nix.settings.experimental-features = [ "nix-command flakes" ];

    nixpkgs.config = {
      allowUnfree = true;
    };

  system.stateVersion = "23.11";
}
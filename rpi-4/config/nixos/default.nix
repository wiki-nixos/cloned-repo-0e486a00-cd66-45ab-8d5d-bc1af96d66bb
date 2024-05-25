{
  imports = [
    ./misc.nix
    ./users.nix
    ./networking.nix
  ];

    nix.settings.experimental-features = [ "nix-command flakes" ];

    nixpkgs.config = {
      allowUnfree = true;
    };

  system.stateVersion = "23.11";
}
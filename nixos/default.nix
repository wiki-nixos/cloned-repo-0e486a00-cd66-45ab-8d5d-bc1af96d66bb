{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration-x13.nix

    ./audio.nix
    ./containers.nix
    ./firefox.nix
    ./locale.nix
    ./misc.nix
    ./networking.nix
    ./users.nix
    ./xfce.nix
    ./zsh.nix
  ];

  nix.settings.experimental-features = [ "nix-command flakes" ];

  nixpkgs.config = {
    allowUnfree = true;

    # hotfix to enable update
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

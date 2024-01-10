{ pkgs, ... }:

{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    killall
    xbindkeys
    xdotool
    xorg.xmodmap
    xorg.xev
    xorg.xhost
    libsForQt5.konsole

    google-chrome
    tor-browser-bundle-bin

    ## dev

    rustc
    rustup
    cargo
    gcc
    gnumake
    python3
    poetry

    openssl
  ];

  programs.dconf.enable = true;
}

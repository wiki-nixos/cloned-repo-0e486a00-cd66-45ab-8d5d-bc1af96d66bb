# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nix.settings.experimental-features = [ "nix-command flakes" ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xfce.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-intel-nuc";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };


  networking.firewall = { # barrier keyboard/mouse sharing
  enable = true;
  allowedTCPPorts = [ 24800 4713 ];
  allowedUDPPorts = [ 24800 4713 ];
};

  # disable default gnome apps:
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
   cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
  
  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "neo";
  };

  # Configure console keymap
  console.keyMap = "de";


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [
      kate
    ];
  };
    security.sudo.extraConfig = ''
      user ALL=(ALL) NOPASSWD: ALL
    '';


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [

    virt-manager
    pkgs.killall
    pkgs.xbindkeys
    pkgs.xdotool
    pkgs.xorg.xmodmap
    pkgs.xorg.xev

    # pulseaudio volume control
    pkgs.pavucontrol
    pkgs.neofetch
  ];


  services.openssh.enable = true;
  system.stateVersion = "23.05"; # Did you read the comment?

  # enable docker
  virtualisation.docker.enable = true;
  # kvm/libvirt etc
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
}

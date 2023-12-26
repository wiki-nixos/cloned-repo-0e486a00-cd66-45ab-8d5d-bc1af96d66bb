# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: 



{

  nix.settings.experimental-features = [ "nix-command flakes" ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration-x13.nix
      ./xfce.nix
      ../home-manager/apps/firefox.nix
      ./containers.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.fwupd.enable = true;


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

  # disable default gnome apps:
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
   cheese # webcam tool
    gnome-music
    # gnome-terminal
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
security.sudo.extraConfig = ''
  Defaults        timestamp_timeout=30
'';

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

  services.blueman.enable = true;
   hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "jackaudio"];
    packages = with pkgs; [
      kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    virt-manager
    pkgs.killall
    pkgs.xbindkeys
    pkgs.xdotool
    pkgs.xorg.xmodmap
    pkgs.xorg.xev
    pkgs.libsForQt5.konsole

    pkgs.google-chrome

    pkgs.spice # copy-paste for vms

    # audio
    pkgs.pavucontrol

    # dev
    pkgs.rustc
    pkgs.rustup
    pkgs.cargo
    pkgs.gcc


    pkgs.python3
    pkgs.poetry

    pkgs.openssl


xorg.xhost
pkgs.tailscale


pkgs.tor-browser-bundle-bin

    # config.nur.repos.mic92.hello-nur
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # hotfix to enable update
        nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0"
    ];

	

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    24800 # barrier keyboard / mouse sharing
   ];
  networking.firewall.allowedUDPPorts = [
  24800 # barrier keyboard / mouse sharing

  ];
    # Enable NAT
    networking.firewall = {
       # if packets are still dropped, they will show up in dmesg
       logReversePathDrops = true;
       # wireguard trips rpfilter up
       extraCommands = ''
         ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
         ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
       '';
       extraStopCommands = ''
         ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
         ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
       '';
      };
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # enable docker
  virtualisation.docker.enable = true;

  # kvm/libvirt etc
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

services.tailscale.enable = true;
}

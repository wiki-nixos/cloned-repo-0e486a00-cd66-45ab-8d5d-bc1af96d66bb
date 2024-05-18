{
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

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    # trace: warning: The option `services.xserver.xkbVariant' defined in `/nix/store/syfpbvi3r122cb2qj6h9k4zgs45axadm-source/nixos/locale.nix' has been renamed to `services.xserver.xkb.variant'.
    xkbVariant = "neo";
# trace: warning: The option `services.xserver.xkbVariant' defined in `/nix/store/syfpbvi3r122cb2qj6h9k4zgs45axadm-source/nixos/locale.nix' has been renamed to `services.xserver.xkb.variant'.
  };

  # Configure console keymap
  console.keyMap = "de";
}

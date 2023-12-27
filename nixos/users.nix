{ config, pkgs, ... }:

{
  security.sudo.extraConfig = ''
    Defaults        timestamp_timeout=30
  '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "jackaudio"
    ];
  };
}

{ config, pkgs, ... }:

{
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
}

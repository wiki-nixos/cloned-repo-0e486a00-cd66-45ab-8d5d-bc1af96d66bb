{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
  };
    security.sudo.extraConfig = ''
      user ALL=(ALL) NOPASSWD: ALL
    '';
}

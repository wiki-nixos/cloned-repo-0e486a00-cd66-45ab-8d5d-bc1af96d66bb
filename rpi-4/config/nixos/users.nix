{ config, pkgs, ... }:

{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = false;
    users.user = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKGUqpHdAfw+Uu0W11YNKVEm4IhHjXvGyWvDRnnSEp6w user@dev-debian-12-23-2-AccSgn" ];
        extraGroups = [
            "wheel"
            "audio"
          ];
      password = "1234";
    };
  };

    security.sudo.extraConfig = ''
      user ALL=(ALL) NOPASSWD: ALL
    '';

}

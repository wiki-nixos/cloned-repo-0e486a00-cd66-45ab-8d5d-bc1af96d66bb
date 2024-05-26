{
  networking = {

networkmanager.enable = true;
  hostName = "nixos-intel-nuc";


    firewall = {
         enable = true;
        allowedTCPPorts = [
          24800 # barrier keyboard / mouse sharing
          46899 # fcast-receiver
        ];
        allowedUDPPorts = [
          24800 # barrier keyboard / mouse sharing
          46898 # fcast-receiver
        ];
};
  };

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };
  }
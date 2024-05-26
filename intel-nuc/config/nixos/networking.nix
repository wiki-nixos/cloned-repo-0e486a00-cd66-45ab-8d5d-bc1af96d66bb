{
  networking = {

networkmanager.enable = true;
  hostName = "nixos-intel-nuc";


    firewall = {
        allowedTCPPorts = [
          24800 # barrier keyboard / mouse sharing
        ];
        allowedUDPPorts = [
          24800 # barrier keyboard / mouse sharing
        ];
};


  };




  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };
  }
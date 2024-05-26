{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    spice # copy-paste for vms
  ];

  # enable docker
  virtualisation.docker.enable = true;

  # kvm/libvirt etc
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
}

{ pkgs, nur, ... }:

let
  jetbrains-override-neo2 = pkgs.callPackage ../pkgs/jetbrains-override-neo2.nix { };
  jetbrains-client = pkgs.callPackage ../pkgs/jetbrains-client { };
in
{
  home.packages = with pkgs; [
    htop
    vim
    wget
    tree
    git
    rpi-imager

    element-desktop
    protonmail-bridge
    thunderbird

    mullvad-browser

    # open source (https://github.com/th-ch/youtube-music)
    youtube-music

    #jetbrains.idea-ultimate
    jetbrains-override-neo2.idea-ultimate
    jetbrains-override-neo2.clion
    jetbrains-client

    nur.repos.mic92.hello-nur

    joplin-desktop
    signal-desktop
    slack

    qbittorrent
    vlc

    barrier # keyboard and mouse sharing
    libreoffice

    speedtest-cli

    monero-gui

    kate
  ];
}

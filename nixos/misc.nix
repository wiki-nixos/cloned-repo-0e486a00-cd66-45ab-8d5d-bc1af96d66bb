{ pkgs, ... }:

{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    killall
    xbindkeys
    xdotool
    xorg.xmodmap
    xorg.xev
    xorg.xhost
    libsForQt5.konsole

    google-chrome
    tor-browser-bundle-bin

    ## dev

    rustc
    rustup
    cargo
    gcc
    gnumake
    zsh
    python3
    poetry

    openssl
  ];

# todo as zsh.nix
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -al";
    };
    ohMyZsh = {
        enable = true;
        plugins = [ "git"];
        theme = "robbyrussell";
      };

      promptInit=''
      source /home/user/.remote-project-management-cli/zsh-completion.sh
      function my-remote-projects() {
          source /home/user/.remote-project-management-cli/bin/remote-project-management-cli-wrapper "$@"
      }
      '';
  };

  programs.dconf.enable = true;
}

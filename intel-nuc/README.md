


todo revoke auto sudo after development



# Configure keymap in X11
services.xserver = {
layout = "de";
xkbVariant = "neo";
};

# Configure console keymap
console.keyMap = "de";

# enable docker
virtualisation.docker.enable = true;
# kvm/libvirt etc
virtualisation.libvirtd.enable = true;
programs.dconf.enable = true;



    virt-manager
    pkgs.killall
    pkgs.xbindkeys
    pkgs.xdotool
    pkgs.xorg.xmodmap
    pkgs.xorg.xev



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




            session = [
                        { manage = "desktop";
                            name = "xterm";
                            start = ''
                              ${pkgs.xterm}/bin/xterm -ls &
                              waitPID=$!
                            '';
                          }
                        ];

        displayManager.sessionCommands= "/run/current-system/sw/bin/fcast-receiver";
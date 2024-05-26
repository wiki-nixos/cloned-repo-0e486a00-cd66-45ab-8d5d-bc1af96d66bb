# reference:
# https://git.sr.ht/~wrmilling/nixos-configuration/tree/30f603e2954c07b743037cdb9f2b30bc073091cc/item/hosts/common/modules/i3wm.nix
let
  mod = "Mod4";
in
{
    services = {
        displayManager = {
            autoLogin = {
                enable = true;
                user = "user";
            };
            defaultSession = "xfce+i3";
        };

        xserver = {
            enable = true;
            desktopManager = {
                xterm.enable = false;
                xfce = {
                    enable = true;
                    noDesktop = true;
                    enableXfwm = false;
                };
            };
            displayManager.lightdm.enable = true;
            windowManager.i3.enable = true;
        };

        autorandr.enable = true;
    };
}

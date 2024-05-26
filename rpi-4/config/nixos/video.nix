{ config, lib, pkgs, ... }:

{

services.displayManager.defaultSession = "xfce";

   services.xserver = {
       enable = true;

       displayManager.lightdm.enable = true;

       #desktopManager.gnome.enable = true;
          desktopManager = {
             xterm.enable = false;
             xfce = {
               enable = true;
               noDesktop = true;
               enableXfwm = false;
             };
           };

       videoDrivers = [ "fbdev" ];
     };

services.autorandr.enable = true;
}